require 'rails_helper'

describe Shopping::CartSerializer do

  describe 'Cart' do
    let(:cart) { create(:cart) }
    let(:options) {{
      serializer: Shopping::CartSerializer
    }}
    let(:json) { ActiveModelSerializers::SerializableResource.new(cart, options).serializable_hash }

    it 'serializes the cart' do
      p json
      expect(json.keys).to include(:data)
      
      expect(json[:data][:id]).to eq(cart.id.to_s)
      
      expect(json[:data].keys).to include(:attributes)
      expect(json[:data][:attributes].keys).to include(:user_id)
      expect(json[:data][:attributes].keys).to include(:purchased_at)

      expect(json[:data].keys).to_not include(:relationships)
    end
  end

  describe 'Cart including line items' do
    let(:cart) { create(:cart) }
    let(:line_item) { create(:line_item, cart: cart) }
    let(:options) {{
      serializer: Shopping::CartSerializer,
      include: 'line_items'
    }}
    let(:json) { ActiveModelSerializers::SerializableResource.new(cart, options).as_json }

    it 'serializes the cart' do
      expect(json.keys).to include(:data)
      
      expect(json[:data][:id]).to eq(cart.id.to_s)
      
      expect(json[:data].keys).to include(:attributes)
      expect(json[:data][:attributes].keys).to include(:user_id)
      expect(json[:data][:attributes].keys).to include(:purchased_at)

      expect(json[:data].keys).to include(:relationships)
      expect(json[:data][:relationships].keys).to include(:line_items)
    end
  end
end
