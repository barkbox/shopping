require 'rails_helper'

describe Shopping::CartSerializer, type: :serializer do

  let(:cart) { create(:cart) }
  let(:options) {{
    serializer: Shopping::CartSerializer
  }}
  let(:json) { ActiveModelSerializers::SerializableResource.new(cart.reload, options).as_json }

  describe 'Cart' do

    it 'serializes the cart' do
      expect(json.keys).to include(:data)
      
      expect(json[:data][:id]).to eq(cart.id.to_s)
      
      expect(json[:data].keys).to include(:attributes)
      expect(json[:data][:attributes].keys).to include(:user_id)
      expect(json[:data][:attributes].keys).to include(:purchased_at)
      expect(json[:data][:relationships].keys).to include(:line_items)

      expect(json.keys).to_not include(:included)
    end
  end

  describe 'Cart with line items (not included)' do
    let!(:line_item) { create(:line_item, cart: cart) }

    it 'serializes the cart' do
      expect(json.keys).to include(:data)
      
      expect(json[:data][:id]).to eq(cart.id.to_s)
      
      expect(json[:data].keys).to include(:attributes)
      expect(json[:data][:attributes].keys).to include(:user_id)
      expect(json[:data][:attributes].keys).to include(:purchased_at)
      expect(json[:data][:relationships].keys).to include(:line_items)

      line_items = json[:data][:relationships][:line_items]
      expect(line_items[:data].count).to eq(1)

      expect(json.keys).to_not include(:included)
    end
  end

  describe 'Cart including line items' do
    let(:options) {{
      serializer: Shopping::CartSerializer,
      include: 'line_items'
    }}
    let!(:line_item) { create(:line_item, cart: cart) }

    it 'serializes the cart' do
      expect(json.keys).to include(:data)
      
      expect(json[:data][:id]).to eq(cart.id.to_s)
      
      expect(json[:data].keys).to include(:attributes)
      expect(json[:data][:attributes].keys).to include(:user_id)
      expect(json[:data][:attributes].keys).to include(:purchased_at)

      expect(json[:data][:relationships].keys).to include(:line_items)

      line_items = json[:data][:relationships][:line_items]

      expect(line_items[:data].count).to eq(1)

      expect(json.keys).to include(:included)
    end
  end
end
