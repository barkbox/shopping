require 'rails_helper'
require 'rspec_api_documentation/dsl'
require 'pry'

resource 'Cart', type: :acceptance do

  let(:cart) { create(:cart) }
  let(:item) { create(:item) }
  let(:id) { cart.id }
  let!(:line_item) { create(:line_item, cart_id: cart.id, source: item, quantity: 1, sale_price: item.price) }

  get '/api/v1/carts/:id' do
    parameter :cart_id, 'Cart id', required: true
    
    let(:expected) {
      {"data"=>{"id"=>"1", "type"=>"carts", "links"=>{"self"=>"http://example.org/api/v1/carts/1"}, "attributes"=>{"user_id"=>nil, "purchased_at"=>nil, "created_at"=> cart.created_at.as_json }, "relationships"=>{"line_items"=>{"links"=>{"self"=>"http://example.org/api/v1/carts/1/relationships/line-items", "related"=>"http://example.org/api/v1/carts/1/line-items"}}}}} 
    }
    
    example 'Show' do
      do_request

      expect(status).to be 200
      expect(JSON.parse(response_body)).to eq(expected)
    end
  end

  get '/api/v1/carts/:id?include=line_items' do
    parameter :cart_id, 'Cart id', required: true
    
    let(:expected) {
      {"data"=>{"id"=>"1", "type"=>"carts", "links"=>{"self"=>"http://example.org/api/v1/carts/1"}, "attributes"=>{"user_id"=>nil, "purchased_at"=>nil, "created_at"=> cart.created_at.as_json }, "relationships"=>{"line_items"=>{"links"=>{"self"=>"http://example.org/api/v1/carts/1/relationships/line-items", "related"=>"http://example.org/api/v1/carts/1/line-items"}}}}} 
    }

    example 'Show incl line items', :run do
      do_request

      p response_body
      expect(status).to be 200
      expect(response_body).to eq(expected)
    end
  end

  get '/api/v1/carts/:id?include=line_items.source' do
    parameter :cart_id, 'Cart id', required: true

    let(:cart) { create(:cart) }
    let(:item) { create(:item) }
    let(:id) { cart.id }
    let!(:line_item) { create(:line_item, cart_id: cart.id, source: item, quantity: 1, sale_price: item.price) }

    example 'Show incl line items and sources' do
      do_request


      expect(status).to be 200
      expect(response_body).to eq(expected)
    end
  end


  get '/api/v1/carts/:id', document: false do

    let(:id) { 9999 }

    example 'Missing' do
      do_request

      expected = {
        :errors => [
          {
            status: '404',
            title:  'Not found'
          }
        ]
      }.to_json
      
      expect(status).to be 404
      expect(response_body).to eq(expected)
    end
  end
end
