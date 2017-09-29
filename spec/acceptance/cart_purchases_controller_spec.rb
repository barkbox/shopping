require 'rails_helper'
require 'rspec_api_documentation/dsl'
require 'support/rspec_api_documentation'

resource 'CartPurchase', type: :acceptance do
  before do
    header 'Content-Type', 'application/vnd.api+json'
  end
  let(:cart) { create(:cart) }
  let(:item) { create(:item) }
  let!(:line_item) { create(:line_item, cart_id: cart.id, source: item, quantity: 1, sale_price: item.price) }

  post '/cart_purchases' do
    parameter :cart_id, scope: [:data, :attributes], required: true
    parameter :options, scope: [:data, :attributes]
    
    let(:cart) { create(:cart, user_id: 1) }
    let(:line_item) { create(:line_item, cart_id: cart.id, source_id: item.id, source_type: item.type) }
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
    before { line_item }

    example 'Create' do
      params = {
        data: {
          type: "cart_purchases",
          attributes: {
            cart_id: cart.id
          }
        }
      }

      do_request params

      expect(status).to eq(201)
      expect(response_json).to eq(expected)
    end    

    example 'Create with existing locked cart purchase' do
    end

    example 'Create with existing failed cart purchase' do
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
  end
end