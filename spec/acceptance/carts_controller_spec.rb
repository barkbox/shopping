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
      {"data"=>{"id"=>"1", "type"=>"carts", "links"=>{"self"=>"http://example.org/api/v1/carts/1"}, "attributes"=>{"user_id"=>nil, "purchased_at"=>nil, "created_at"=> cart.created_at.as_json }, "relationships"=>{"line_items"=>{"links"=>{"self"=>"http://example.org/api/v1/carts/1/relationships/line_items", "related"=>"http://example.org/api/v1/carts/1/line_items"}}}}} 
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
      {"data"=>
        {"id"=>"1",
         "type"=>"carts",
         "links"=>{"self"=>"http://example.org/api/v1/carts/1"},
         "attributes"=>
          {"user_id"=>nil,
           "purchased_at"=>nil,
           "created_at"=> cart.created_at.as_json },
         "relationships"=>
          {"line_items"=>
            {"links"=>
              {"self"=>"http://example.org/api/v1/carts/1/relationships/line_items",
               "related"=>"http://example.org/api/v1/carts/1/line_items"},
             "data"=>[{"type"=>"line_items", "id"=>"1"}]}}},
       "included"=>
        [{"id"=>"1",
          "type"=>"line_items",
          "links"=>{"self"=>"http://example.org/api/v1/line_items/1"},
          "attributes"=>
           {"cart_id"=>1,
            "sale_price"=>"5.0",
            "list_price"=>"5.0",
            "quantity"=>1,
            "created_at"=> line_item.created_at.as_json,
            "updated_at"=> line_item.updated_at.as_json,
            "source_id" => line_item.source_id,
            "source_type" => line_item.source_type,
            "source_sku" => line_item.source.sku},
          "relationships"=>
           {
            "cart"=>
             {"links"=>
               {"self"=>"http://example.org/api/v1/line_items/1/relationships/cart",
                "related"=>"http://example.org/api/v1/line_items/1/cart"}}}}]}
    }

    example 'Show incl line items', :run do
      do_request

      expect(status).to be 200
      expect(JSON.parse(response_body)).to eq(expected)
    end
  end


  get '/api/v1/carts/:id', document: false do

    let(:id) { 9999 }

    example 'Missing' do
      do_request

      expected = {
        :errors => [
          {
            title:  'Record not found',
            detail: 'The record identified by 9999 could not be found.',
            code: '404',
            status: '404',
          }
        ]
      }.to_json
      
      expect(status).to be 404
      expect(response_body).to eq(expected)
    end
  end
end
