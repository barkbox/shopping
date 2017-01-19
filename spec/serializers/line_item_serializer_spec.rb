require 'rails_helper'

describe Shopping::LineItemSerializer, type: :serializer do

  let(:line_item) { create(:line_item, source: create(:item), sale_price: 5.0, list_price: 5.0, quantity: 2) }
  let(:json) { JSON.parse(ActiveModelSerializers::SerializableResource.new(line_item, options).to_json) }

  describe 'LineItem' do
    let(:options) {{
      serializer: Shopping::LineItemSerializer,
    }}

    it 'serializes the line item' do
      expect(json.keys).to include("data")
      
      expect(json["data"]["id"]).to eq(line_item.id.to_s)
      
      expect(json["data"].keys).to include("attributes")
      expect(json["data"]["attributes"].keys).to include("sale_price")
      expect(json["data"]["attributes"].keys).to include("list_price")
      expect(json["data"]["attributes"].keys).to include("quantity")
      expect(json["data"]["attributes"].keys).to include("created_at")
      expect(json["data"]["attributes"].keys).to include("updated_at")
      
      expect(json["data"]["relationships"].keys).to include("source")

      expect(json["data"]["relationships"]["source"]).to_not include("data")
      expect(json.keys).to_not include("included")
    end
  end

  describe 'LineItem including source' do
    let(:options) {{
      serializer: Shopping::LineItemSerializer,
      include: 'source'
    }}

    it 'serializes the line item' do
      expect(json.keys).to include("data")
      
      expect(json["data"]["id"]).to eq(line_item.id.to_s)
      
      expect(json["data"].keys).to include("attributes")
      expect(json["data"]["attributes"].keys).to include("sale_price")
      expect(json["data"]["attributes"].keys).to include("list_price")
      expect(json["data"]["attributes"].keys).to include("quantity")
      expect(json["data"]["attributes"].keys).to include("created_at")
      expect(json["data"]["attributes"].keys).to include("updated_at")
      
      expect(json["data"]["relationships"].keys).to include("source")

      expect(json["data"]["relationships"]["source"]).to include("data")
      expect(json.keys).to include("included")
      expect(json["included"].count).to eq(1)
    end
  end
end
