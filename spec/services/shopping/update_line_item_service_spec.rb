require 'rails_helper'

describe Shopping::UpdateLineItemService do
  before do 
    @cart = create(:cart)
    @item = create(:item)
  end

  describe '#perform!' do
    it 'validates presence of cart' do
      service = Shopping::UpdateLineItemService.new(nil, @item, 1)
      expect{ service.perform! }.to raise_error(Shopping::ServiceError, /cart can't be blank/i)
    end

    it 'validates presence of source' do
      service = Shopping::UpdateLineItemService.new(@cart, nil, 1)
      expect{ service.perform! }.to raise_error(Shopping::ServiceError, /source can't be blank/i)
    end

    it 'validates unpurchased cart' do
      service = Shopping::UpdateLineItemService.new(create(:cart, purchased_at: 1.day.ago), @item, 1)
      expect{ service.perform! }.to raise_error(Shopping::ServiceError, /can't update purchased line item/i)
    end

    shared_examples_for 'it updates a line item in the cart' do
      it 'should update an existing line item' do
        cart = create(:cart)
        source = create(:item)
        cart.line_items << create(:line_item, source_id: source.id, source_type: source.class.name, sale_price: source.price, quantity: 1)
        cart.reload
        service = Shopping::UpdateLineItemService.new(cart, source, 5)
        service.perform!
        expect(cart.line_items.count).to eq(1)
        expect(cart.line_items.first.quantity).to eq(5)
        expect(cart.line_items.first.source).to eq(source)
      end

      it 'raises an error if no line item is found' do
        service = Shopping::UpdateLineItemService.new(cart, source, 1)
        expect{ service.perform! }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  
    describe 'adding an item to cart' do
      it_should_behave_like 'it updates a line item in the cart' do
        let(:cart) { create(:cart) }
        let(:source) { create(:item) }
      end
    end
  end
end
