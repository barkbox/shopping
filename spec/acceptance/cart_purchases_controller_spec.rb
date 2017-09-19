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

  post '/api/v1/cart_purchases' do
    parameter :cart_id, scope: [:data, :attributes], required: true

    let(:cart) { create(:cart, user_id: 1) }
    let(:line_item) { create(:line_item, cart_id: cart.id, source_id: item.id, source_type: item.type) }
    let(:expected) {
      cp = Shopping::CartPurchase.first
      {"data"=>
        {"id"=>cp.id.to_s,
         "type"=>"cart_purchases",
         "links"=>{"self"=>"http://example.org/api/v1/cart_purchases/#{cp.id}"},
         "attributes"=>
          {"cart_id"=>cart.id,
           "created_at"=>cp.created_at.as_json,
           "succeeded_at"=>nil,
           "failed_at"=>nil},
         "relationships"=>
          {"cart"=>
            {"links"=>
              {"self"=>
                "http://example.org/api/v1/cart_purchases/#{cp.id}/relationships/cart",
               "related"=>"http://example.org/api/v1/cart_purchases/#{cp.id}/cart"}}}}}
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
      # p response_body
      expect(status).to eq(201)
      expect(JSON.parse(response_body)).to eq(expected)
      puts JSON.parse(response_body)
    end    

    example 'Create with existing locked cart purchase' do
    end

    example 'Create with existing failed cart purchase' do
    end
  end
  
end