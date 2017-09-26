require 'rails_helper'
require 'rspec_api_documentation/dsl'
require 'support/rspec_api_documentation'

resource 'Cart', type: :acceptance do

  before do
    header 'Content-Type', 'application/vnd.api+json'
  end

  let(:cart) { create(:cart) }
  let(:item) { create(:item) }
  let(:id) { cart.id }
  let!(:line_item) { create(:line_item, cart_id: cart.id, source: item, quantity: 1, sale_price: item.price) }

  get '/carts/:id' do
    parameter :cart_id, 'Cart ID', required: true
    
    let(:expected) {
      {"data"=>
        {"id"=>"#{cart.id}", 
         "type"=>"carts", 
         "links"=>{"self"=>"http://example.org/carts/#{cart.id}"},
         "attributes"=>
          {"user_id"=>cart.user_id, 
           "purchased_at"=>nil, 
           "created_at"=> cart.created_at.as_json,
           "updated_at"=> cart.updated_at.as_json,
           "origin" => nil,}, "relationships"=>{
            "line_items" => 
              { "links" => { 
                "self" => "http://example.org/carts/#{cart.id}/relationships/line_items", 
                "related"=>"http://example.org/carts/#{cart.id}/line_items"
                }
              },
            "cart_purchases" => 
              { "links" => {
                "self" => "http://example.org/carts/#{cart.id}/relationships/cart_purchases", 
                "related"=>"http://example.org/carts/#{cart.id}/cart_purchases"
              }
            }
          }}} 
    }
    
    example 'Show' do
      do_request

      expect(status).to be 200
      expect(JSON.parse(response_body)).to eq(expected)
    end
  end

  get '/carts/:id?include=line_items' do
    parameter :cart_id, 'Cart ID', required: true
    
    let(:expected) {
      {"data"=>
        {"id"=>"#{cart.id}",
         "type"=>"carts",
         "links"=>{"self"=>"http://example.org/carts/#{cart.id}"},
         "attributes"=>
          {"user_id"=>cart.user_id,
           "purchased_at"=>nil,
           "created_at"=> cart.created_at.as_json,
           "updated_at"=> cart.updated_at.as_json,
           "origin" => nil},
         "relationships"=>
          {"line_items"=>
            {"links"=>
              {"self"=>"http://example.org/carts/#{cart.id}/relationships/line_items",
               "related"=>"http://example.org/carts/#{cart.id}/line_items"},
             "data"=>[{"type"=>"line_items", "id"=>"#{line_item.id}"}]},
            "cart_purchases" => 
              { "links" => {
                "self" => "http://example.org/carts/#{cart.id}/relationships/cart_purchases", 
                "related"=>"http://example.org/carts/#{cart.id}/cart_purchases"
              }
            }}},
       "included"=>
        [{"id"=>"#{line_item.id}",
          "type"=>"line_items",
          "links"=>{"self"=>"http://example.org/line_items/#{line_item.id}"},
          "attributes"=>
           {"cart_id"=>cart.id,
            "sale_price"=>"5.0",
            "list_price"=>"5.0",
            "quantity"=>1,
            "created_at"=> line_item.created_at.as_json,
            "updated_at"=> line_item.updated_at.as_json,
            "source_id" => line_item.source_id,
            "source_type" => line_item.source_type,
            "source_sku" => line_item.source.sku,
            "options"=>{}},
          "relationships"=>
           {
            "cart"=>
             {"links"=>
               {"self"=>"http://example.org/line_items/#{line_item.id}/relationships/cart",
                "related"=>"http://example.org/line_items/#{line_item.id}/cart"}}}}]}
    }

    example 'Show incl line items', :run do
      do_request

      expect(status).to eq 200
      expect(JSON.parse(response_body)).to eq(expected)
    end
  end


  get '/carts/:id', document: false do

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

  post '/carts' do
    parameter :origin, 'Origin', scope: [:data, :attributes]
    parameter :user_id, 'User ID', scope: [:data, :attributes]

    let(:params){
      {data: 
        {
          type: 'carts',
          attributes: {
            origin: 'text',
            user_id: 1
          }
        }
      }
    }

    let(:expected){
      {"data"=>
        {"id"=>"#{Shopping::Cart.last.id}",
         "type"=>"carts",
         "links"=>{"self"=>"http://example.org/carts/#{Shopping::Cart.last.id}"},
         "attributes"=>
          {"user_id"=>1,
           "purchased_at"=>nil,
           "created_at"=>"#{Shopping::Cart.last.created_at.as_json}",
           "updated_at"=>"#{Shopping::Cart.last.updated_at.as_json}",
           "origin"=>"text"},
         "relationships"=>
          {"line_items"=>
            {"links"=>
              {"self"=>"http://example.org/carts/#{Shopping::Cart.last.id}/relationships/line_items",
               "related"=>"http://example.org/carts/#{Shopping::Cart.last.id}/line_items"}},
           "cart_purchases"=>
            {"links"=>
              {"self"=>"http://example.org/carts/#{Shopping::Cart.last.id}/relationships/cart_purchases",
               "related"=>"http://example.org/carts/#{Shopping::Cart.last.id}/cart_purchases"}
        }}}}
    }

    example 'Create with user and origin' do
      do_request params

      expect(status).to be 201
      expect(JSON.parse(response_body)).to eq(expected)
    end
  end
end
