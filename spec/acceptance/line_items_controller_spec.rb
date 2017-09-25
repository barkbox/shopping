require 'rails_helper'
require 'rspec_api_documentation/dsl'
require 'pry'
require 'support/rspec_api_documentation'

resource 'LineItem', type: :acceptance do
  before do
    header 'Content-Type', 'application/vnd.api+json'
  end

  post '/line_items' do
    parameter :cart_id, scope: [:data, :attributes], required: true
    parameter :source_id, scope: [:data, :attributes], required: true
    parameter :source_type, scope: [:data, :attributes], required: true
    parameter :sale_price, scope: [:data, :attributes], required: true
    parameter :list_price, scope: [:data, :attributes], required: true

    let(:cart) { create(:cart) }
    let(:cart_id) { cart.id }
    let(:item) { create(:item) }
    let(:expected){
      li = Shopping::LineItem.first
      {"data"=>
                  {"id"=>"#{li.id}",
                   "type"=>"line_items",
                   "links"=>{"self"=>"http://example.org/line_items/#{li.id}"},
                   "attributes"=>
                    {"cart_id"=> cart_id,
                     "sale_price"=>"1.0",
                     "list_price"=>"1.0",
                     "quantity"=>nil,
                     "created_at"=> li.created_at.as_json,
                     "updated_at"=> li.updated_at.as_json,
                     "source_id"=> item.id,
                     "source_type"=>"Item",
                     "source_sku"=>"IMASKU",
                     "options"=>{}},
                   "relationships"=>
                    {"cart"=>
                      {"links"=>
                        {"self"=>"http://example.org/line_items/#{li.id}/relationships/cart",
                         "related"=>"http://example.org/line_items/#{li.id}/cart"}}}}}
    }

    example 'Create' do
      params = {
        data:{
          type: "line_items",
          attributes: {
            cart_id: cart.id,
            source_id: item.id,
            source_type: item.class.name,
            sale_price: 1.0,
            list_price: 1.0
          }
        }
      }

      do_request params
      expect(status).to eq(201)
      expect(JSON.parse(response_body)).to eq(expected)
      expect(Shopping::Cart.count).to eq(1)
    end
  end

  put '/line_items/:id' do
    parameter :id, 'Line item id', required: true

    let(:cart) { create(:cart) }
    let(:cart_id) { cart.id }
    let(:item) { create(:item) }
    let!(:line_item) { create(:line_item, cart_id: cart.id, source: item, quantity: 1, sale_price: item.price) }
    let(:id) { line_item.id }
    let(:expected){
      {"data"=>
        {"id"=>"#{id}",
         "type"=>"line_items",
         "links"=>{"self"=>"http://example.org/line_items/#{id}"},
         "attributes"=>
          {"cart_id"=>cart_id,
           "sale_price"=>"5.0",
           "list_price"=>"5.0",
           "quantity"=>2,
           "created_at"=> line_item.created_at.as_json,
           "updated_at"=> line_item.reload.updated_at.as_json,
           "source_id"=> item.id,
           "source_type"=>"Item",
           "source_sku"=>"IMASKU",
           "options"=>{}},
         "relationships"=>
          {"cart"=>
            {"links"=>
              {"self"=>"http://example.org/line_items/#{id}/relationships/cart",
               "related"=>"http://example.org/line_items/#{id}/cart"}}}}}
    }

    example 'Update' do

      params = {
        data: {
          id: line_item.id,
          type: "line_items",
          attributes: {
            quantity: 2
          }
        }
      }
      
      do_request params

      expect(status).to be 200
      expect(JSON.parse(response_body)).to eq(expected)
      expect(Shopping::Cart.count).to eq(1)
    end
  end

  delete '/line_items/:id' do
    parameter :line_item_id, 'Line item id', required: true

    let(:cart) { create(:cart) }
    let(:cart_id) { cart.id }
    let(:item) { create(:item) }
    let!(:line_item) { create(:line_item, cart_id: cart.id, source: item, quantity: 1, sale_price: item.price) }
    let(:id) { line_item.id }

    example 'Delete' do
      expect(Shopping::LineItem.count).to eq(1)
      
      do_request

      expect(status).to be 204
      expect(Shopping::LineItem.count).to eq(0)
    end
  end
end
