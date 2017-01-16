require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'LineItem', type: :acceptance do

  post '/api/v1/line_items' do
    parameter :cart_id, 'Cart id'
    parameter :source_id, 'Source id', required: true
    parameter :source_type, 'Source type', required: true

    let(:cart) { create(:cart) }
    let(:item) { create(:item) }

    example 'Create' do
      expect(Item).to receive(:find).and_return(item)

      params = nest_attributes({
        cart_id: cart.id,
        source_id: item.id,
        source_type: item.type
      })

      do_request params

      line_item = Shopping::LineItem.first
      expected = ActiveModelSerializers::SerializableResource.new(cart).to_json # request specs should not test the serializer

      expect(status).to be 200
      expect(response_body).to eq(expected)
      expect(Shopping::Cart.count).to eq(1)
    end
  end

  post '/api/v1/line_items', document: false do

    let(:item) { create(:item) }

    example 'Create [new cart]' do

      expect(Item).to receive(:find).and_return(item)

      params = nest_attributes({
        source_id: item.id,
        source_type: item.type
      })

      do_request params

      line_item = Shopping::LineItem.first
      expected = ActiveModelSerializers::SerializableResource.new(line_item).to_json # request specs should not test the serializer

      expect(status).to be 200
      expect(response_body).to eq(expected)
      expect(Shopping::Cart.count).to eq(1)
    end
  end
  
  post '/api/v1/line_items', document: false do
    let(:cart) { create(:cart) }
    let(:item) { create(:item) }
    let(:line_item) { create(:line_item, cart_id: cart.id, source_id: item.id, source_type: 'Item', quantity: 1, sale_price: item.price) }

    example 'Create [existing item]' do

      expect(Item).to receive(:find).and_return(item)

      params = nest_attributes({
        cart_id: cart.id,
        source_id: line_item.source_id,
        source_type: line_item.source_type,
        quantity: 1
      })

      do_request params

      line_item = Shopping::LineItem.first
      expected = ActiveModelSerializers::SerializableResource.new(line_item).to_json # request specs should not test the serializer

      expect(status).to be 200
      expect(response_body).to eq(expected)
      expect(Shopping::Cart.count).to eq(1)
      expect(line_item.quantity).to eq(2)
    end
  end

  put '/api/v1/line_items/:id' do
    parameter :line_item_id, 'Line item id', requred: true

    let!(:line_item) { create(:line_item) }
    let(:id) { line_item.id }

    example 'Update' do

      params = nest_attributes({
        quantity: 2
      })
      
      do_request

      line_item = Shopping::LineItem.first
      expected = ActiveModelSerializers::SerializableResource.new(line_item).to_json # request specs should not test the serializer

      expect(status).to be 200
      expect(response_body).to eq(expected)
      expect(Shopping::Cart.count).to eq(1)
    end
  end

  delete '/api/v1/line_items/:id' do
    parameter :line_item_id, 'Line item id', requred: true

    let!(:line_item) { create(:line_item) }
    let(:id) { line_item.id }

    example 'Delete' do
      line_item = Shopping::LineItem.first
      expected = ActiveModelSerializers::SerializableResource.new(line_item).to_json # request specs should not test the serializer
      expect(Shopping::LineItem.count).to eq(1)
      
      do_request

      expect(status).to be 200
      expect(response_body).to eq(expected)
      expect(Shopping::LineItem.count).to eq(0)
    end
  end
end
