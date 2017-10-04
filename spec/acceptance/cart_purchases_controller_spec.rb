require 'rails_helper'
require 'rspec_api_documentation/dsl'
require 'support/rspec_api_documentation'

resource 'CartPurchase', type: :acceptance do

  before do
    header 'Content-Type', 'application/vnd.api+json'
  end

  let(:item) { create(:item) }

  get '/cart_purchases/:id' do

    let(:cart) { create(:cart, user_id: 1) }
    let(:line_item) { create(:line_item, cart_id: cart.id, source_id: item.id, source_type: item.type) }
    let(:user_id) { 1 }
    let(:cart) { create(:cart, user_id: user_id) }
    let(:cart_purchase){ create(:cart_purchase, cart_id: cart.id)}
    let(:id){ cart_purchase.id}

    parameter :cart_purchase_id, 'Cart Purchase ID', required: true

    example 'owner is logged in' do
      expected = {:data=>
        {:id=>"#{id}",
         :type=>"cart_purchases",
         :links=>{:self=>"http://example.org/cart_purchases/#{id}"},
         :attributes=>
          {:cart_id=>cart.id,
           :created_at=>"#{cart_purchase.created_at.as_json}",
           :succeeded_at=>nil,
           :failed_at=>nil,
           :options=>{}},
         :relationships=>
          {:cart=>
            {:links=>
              {:self=>"http://example.org/cart_purchases/#{id}/relationships/cart",
               :related=>"http://example.org/cart_purchases/#{id}/cart"}}}}}
      log_in_user(user_id)
      do_request(cart_purchase_id: cart_purchase.id)
      expect(status).to eq(200)
      expect(response_json).to eq(expected)
    end

    example 'non-owner is logged in' do
      expected = {:errors=>
        [{:title=>"Show Forbidden",
          :detail=>"You don't have permission to show this shopping/cart purchase.",
          :code=>"403",
          :status=>"403"}]}
      log_in_user(4)
      do_request
      expect(status).to eq(403)
      expect(response_json).to eq(expected)
    end

    example 'no one is logged in' do
      expected = {:errors=>
        [{:title=>"Show Forbidden",
          :detail=>"You don't have permission to show this shopping/cart purchase.",
          :code=>"403",
          :status=>"403"}]}
      do_request
      expect(status).to eq(403)
    end

  end

  post '/cart_purchases' do
    parameter :cart_id, scope: [:data, :attributes], required: true
    parameter :options, scope: [:data, :attributes]

    let(:cart) { create(:cart, user_id: 1) }
    let(:line_item) { create(:line_item, cart_id: cart.id, source_id: item.id, source_type: item.type) }
    let(:user_id) { 1 }
    let(:cart) { create(:cart, user_id: user_id) }
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
               "related"=>"http://example.org/cart_purchases/#{cp.id}/cart"}}}}}.deep_symbolize_keys
    }
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
        log_in_user(cart.user_id)
        do_request params
        expect(status).to eq(201)
        expect(response_json).to eq(expected)
      end
    end

    context 'user is not logged in' do
      let(:expected){
        {:errors=>
          [{:title=>"Create Forbidden",
            :detail=>
             "You don't have permission to create this shopping/cart purchase.",
            :code=>"403",
            :status=>"403"}]}
      }
      example 'Create' do
        log_out_user
        do_request params
        expect(status).to eq(403)
        expect(response_json).to eq(expected)
      end
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
      log_in_user(cart.user_id)
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
      log_in_user(cart.user_id)

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

end
