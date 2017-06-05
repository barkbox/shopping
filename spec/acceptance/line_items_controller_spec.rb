require 'rails_helper'
require 'rspec_api_documentation/dsl'
require 'pry'

resource 'LineItem', type: :acceptance do
  before do
    header 'Content-Type', 'application/vnd.api+json'
  end

  post '/api/v1/line_items' do
    # parameter :cart_id, 'Cart id'
    # parameter :source_id, 'Source id', required: true
    # parameter :source_type, 'Source type', required: true

    let(:cart) { create(:cart) }
    let(:cart_id) { cart.id }
    let(:item) { create(:item) }

    example 'Create' do
      expect(Item).to receive(:find).and_return(item)

      params = {
        line_item: {
          cart_id: cart.id,
          source_id: item.id,
          source_type: item.class.name
        }
      }

      do_request params
      line_item = Shopping::LineItem.first
      expected = ActiveModelSerializers::SerializableResource.new(line_item.cart, include: :line_items).to_json # request specs should not test the serializer

      expect(status).to be 200
      expect(response_body).to eq(expected)
      expect(Shopping::Cart.count).to eq(1)
    end
  end
  
  post '/api/v1/line_items', document: false do
    let(:cart) { create(:cart) }
    let(:cart_id) { cart.id }
    let(:item) { create(:item) }
    let!(:line_item) { create(:line_item, cart_id: cart.id, source: item, quantity: 1, sale_price: item.price) }

    example 'Create [existing item]' do

      expect(Item).to receive(:find).and_return(item)

      params = nest_attributes({
        line_item: 
        {
          cart_id: cart.id,
          source_id: line_item.source_id,
          source_type: line_item.source_type,
          quantity: 1
        }
      })

      do_request params

      line_item = Shopping::LineItem.first
      expected = ActiveModelSerializers::SerializableResource.new(line_item.cart, include: :line_items).to_json # request specs should not test the serializer

      expect(status).to be 200
      expect(response_body).to eq(expected)
      expect(Shopping::Cart.count).to eq(1)
      expect(line_item.quantity).to eq(2)
    end
  end

  put '/api/v1/line_items/:id' do
    parameter :id, 'Line item id', required: true

    let(:cart) { create(:cart) }
    let(:cart_id) { cart.id }
    let(:item) { create(:item) }
    let!(:line_item) { create(:line_item, cart_id: cart.id, source: item, quantity: 1, sale_price: item.price) }
    let(:id) { line_item.id }

    example 'Update' do

      params = nest_attributes({
        quantity: 2
      })
      
      do_request params

      line_item = Shopping::LineItem.first
      expected = ActiveModelSerializers::SerializableResource.new(line_item.cart, include: :line_items).to_json # request specs should not test the serializer

      expect(status).to be 200
      expect(response_body).to eq(expected)
      expect(Shopping::Cart.count).to eq(1)
    end
  end

  delete '/api/v1/line_items/:id' do
    parameter :line_item_id, 'Line item id', required: true

    let(:cart) { create(:cart) }
    let(:cart_id) { cart.id }
    let(:item) { create(:item) }
    let!(:line_item) { create(:line_item, cart_id: cart.id, source: item, quantity: 1, sale_price: item.price) }
    let(:id) { line_item.id }

    example 'Delete' do
      expect(Shopping::LineItem.count).to eq(1)
      
      do_request

      expected = ActiveModelSerializers::SerializableResource.new(line_item.cart, include: :line_items).to_json # request specs should not test the serializer

      expect(status).to be 200
      expect(response_body).to eq(expected)
      expect(Shopping::LineItem.count).to eq(0)
    end
  end
end
