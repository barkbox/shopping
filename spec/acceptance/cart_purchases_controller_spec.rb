# o Require login:
#   x /cart_purchases POST
#   x /cart_purchases/:id GET
#   o /cart_purchases/:id PATCH
#   o /carts/:id GET (if user_id is set)
#   o /carts/:id PATCH (if user_id is set)
#   o /line_items/:id GET PATCH (if user_id of associated cart is set)
# o You can create/update carts and line items without logging in if no user is assigned to the cart

require 'rails_helper'
require 'rspec_api_documentation/dsl'
require 'support/rspec_api_documentation'

def log_in_user(resource_owner_id)
  token = double :acceptable? => true, :resource_owner_id => resource_owner_id
  user = Struct.new(:id)
  allow_any_instance_of(Shopping::Config).to receive(:current_user_method).and_return(lambda { user.new(resource_owner_id) })
  allow(self).to receive(:doorkeeper_token) {token}
  allow_any_instance_of(Shopping::ApiController).to receive(:doorkeeper_token) { token }
end

def log_out_user
  # token = double 'token'
  token = double :acceptable? => false, :accessible? => false
  # allow(token).to receive(:acceptable?).and_return(false)
  # allow(token).to receive(:accessible?).and_return(false)
  allow_any_instance_of(Shopping::ApiController).to receive(:doorkeeper_token) { token }
end

resource 'CartPurchase', type: :acceptance do
  before do
    header 'Content-Type', 'application/vnd.api+json'
  end
  # let(:cart) { create(:cart) }
  let(:item) { create(:item) }
  # let!(:line_item) { create(:line_item, cart_id: cart.id, source: item, quantity: 1, sale_price: item.price) }

  post '/cart_purchases' do
    parameter :cart_id, scope: [:data, :attributes], required: true
    parameter :options, scope: [:data, :attributes]

    let(:cart) { create(:cart, user_id: 1) }
    let(:line_item) { create(:line_item, cart_id: cart.id, source_id: item.id, source_type: item.type) }
    let(:user_id) { 1 }
    let(:cart) { create(:cart, user_id: user_id) }
    # let(:line_item) { create(:line_item, cart_id: cart.id, source_id: item.id, source_type: item.type) }
    let(:expected) {
      cp = Shopping::CartPurchase.first
      {"data"=>
        {"id"=>cp.id.to_s,
         "type"=>"cart_purchases",
         "links"=>{"self"=>"http://example.org/cart_purchases/#{cp.id}"},
         "attributes"=>
          {"cart_id"=>cart.id,
           "created_at"=>cp.created_at.as_json,
           "succeeded_at"=>nil,
           "failed_at"=>nil,
           "options" => {}},
         "relationships"=>
          {"cart"=>
            {"links"=>
              {"self"=>
                "http://example.org/cart_purchases/#{cp.id}/relationships/cart",
               "related"=>"http://example.org/cart_purchases/#{cp.id}/cart"}}}}}
    }
    # before { line_item }
    let(:params) do
      {
        data: {
          type: "cart_purchases",
          attributes: { cart_id: cart.id }
        }
      }
    end

    context 'user is logged in' do

      example 'Create' do
        log_in_user(user_id)
        do_request params
        expect(status).to eq(201)
        expect(JSON.parse(response_body)).to eq(expected)
      end
    end

    context 'user is not logged in' do
      # change to user token is expired/revoked?
      example 'Create' do
        log_out_user
        do_request params
        expect(status).to eq(401)
        expect(response_body).to eq('')
      end
    end
  end

  get '/cart_purchases/:id' do
    parameter :id, scope: [:data], required: true

    let(:user_id) { 12345 }
    let(:cart) { create(:cart, user_id: user_id) }
    let!(:line_item) { create(:line_item, cart_id: cart.id, source_id: item.id, source_type: item.type) }
    let!(:cart_purchase) { create :cart_purchase, cart: cart }
    let(:id) { cart_purchase.id}
    let(:expected) {
      cp = Shopping::CartPurchase.first
      {data:
        {id: cp.id.to_s,
         type: "cart_purchases",
         links: {self: "http://example.org/cart_purchases/#{cp.id}"},
         attributes:
          {cart_id: cart.id,
           created_at: cp.created_at.as_json,
           succeeded_at: nil,
           failed_at: nil,
           options: {}},
         relationships:
          {cart:
            {links:
              {self:
                "http://example.org/cart_purchases/#{cp.id}/relationships/cart",
               related: "http://example.org/cart_purchases/#{cp.id}/cart"}}}}}
    }
    let(:params) do
      {
        data: {
          type: "cart_purchases",
          id: cart_purchase.id
        }
      }
    end

    context 'associated cart has an owner and current user is not logged in' do
      example do
        log_out_user
        do_request params
        p response_headers
        # TODO update this
        expect(status).to eq(403)
        response = JSON.parse(response_body)
        expect(response['errors'].first['meta']['exception']).to eq('some error object that responds to `status`')
      end
    end

    context 'current user is owner of the associated cart' do
      before do
        log_in_user(user_id)
      end

      example do
        do_request params
        expect(status).to eq(200)
        expect(JSON.parse(response_body)).to eq(expected)
      end
    end

    context 'current user is not owner of associated cart' do
      before do
        log_in_user(12039812)
      end

      example do
        do_request params
        # p response_headers
        # p JSON.parse(response_body)

        # TODO update this
        expect(status).to eq(500)
        response = JSON.parse(response_body)
        # expect(response['errors'].first['meta']['exception']).to eq('not authorized')
      end
    end
  end

  patch '/cart_purchases/:id' do
    parameter :id, scope: [:data], required: true
    # parameter :user_id, scope: [:data, :attributes], required: true

    let(:user_id) { 12345 }
    let(:cart) { create(:cart, user_id: user_id) }
    let!(:line_item) { create(:line_item, cart_id: cart.id, source_id: item.id, source_type: item.type) }
    let!(:cart_purchase) { create :cart_purchase, cart: cart }
    let(:id) { cart_purchase.id}
    let(:time) { Time.zone.now }
    let(:expected) {
      cp = Shopping::CartPurchase.first
      {"data"=>
        {"id"=>cp.id.to_s,
         "type"=>"cart_purchases",
         "links"=>{"self"=>"http://example.org/cart_purchases/#{cp.id}"},
         "attributes"=>
          {"cart_id"=>cart.id,
           "created_at"=>cp.created_at.as_json,
           "succeeded_at"=> time,
           "failed_at"=>nil},
         "relationships"=>
          {"cart"=>
            {"links"=>
              {"self"=>
                "http://example.org/cart_purchases/#{cp.id}/relationships/cart",
               "related"=>"http://example.org/cart_purchases/#{cp.id}/cart"}}}}}
    }
    let(:params) do
      {
        data: {
          type: "cart_purchases",
          id: cart_purchase.id,
          attributes: { succeeded_at: time }
        }
      }
    end

    example 'FIX' do
      do_request params

      expect(status).to eq(201)
      expect(response_json).to eq(expected)
    end

    context 'user is not logged in' do
    end

    context 'current user is owner of the associated cart' do
      # succeeded_at
      # failed_at
    end

    context 'current user is not owner of associated cart' do
      # succeeded_at
      # failed_at
    end

    example 'When an associated record is not included or not found', document: false do
      params = {
        data: {
          type: "cart_purchases",
          attributes: {
            cart_id: cart.id,
            options: {
              address_id: nil
            }
          }
        }
      }
      expected_error = { errors: [{title: "Bad Request", detail: {}, code: "400", status: "400"}] }

      with_exception(ActiveRecord::RecordNotFound) do
        do_request params
      end

      expect(status).to eq(400), "Expected 400 got: #{status}, response body: #{response_body}"

      expect(response_json).to eq(expected_error)
    end


    example 'When an internal server error occurs' do
      params = {
        data: {
          type: "cart_purchases",
          attributes: {
            cart_id: cart.id
          }
        }
      }

      with_exception(NameError) do
        do_request params
      end

      expect(status).to eq(500), "Expected 500 got: #{status}, response body: #{response_body}"
      expect(response_json[:errors][0][:title]).to eq("Internal Server Error")
      expect(response_json[:errors][0][:detail]).to eq("Internal Server Error")
      expect(response_json[:errors][0][:code]).to eq("500")
      expect(response_json[:errors][0][:status]).to eq("500")
    end
  end

  def with_exception(exn)
    Shopping.config.purchase_cart_service_class.throw_error(exn)
    yield
    Shopping.config.purchase_cart_service_class.throw_error(nil)
  end

  def response_json
    JSON.parse(response_body, symbolize_names: true)
    # example 'Create with existing locked cart purchase' do
    # end

    # example 'Create with existing failed cart purchase' do
    # end

  end
end
