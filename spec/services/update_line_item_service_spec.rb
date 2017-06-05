require 'rails_helper'

describe UpdateLineItemService do
  before do 
    @cart = create(:cart)
    @item = create(:item)
    @line_item = create(:line_item, source: @item, cart_id: @cart.id, quantity: 1)
  end

  describe '#perform!' do
    it 'validates presence of cart' do
      service = UpdateLineItemService.new(@line_item, nil, @item, 1)
      expect{ service.perform! }.to raise_error(ServiceError, /cart can't be blank/i)
    end

    it 'validates presence of source' do
      service = UpdateLineItemService.new(@line_item, @cart, nil, 1)
      expect{ service.perform! }.to raise_error(ServiceError, /source can't be blank/i)
    end

    it 'validates presence of quantity' do
      service = UpdateLineItemService.new(@line_item, @cart, @item, nil)
      expect{ service.perform! }.to raise_error(ServiceError, /quantity can't be blank/i)
    end

    it 'validates presence of line_item' do
      service = UpdateLineItemService.new(nil, @cart, @item, nil)
      expect{ service.perform! }.to raise_error(ServiceError, /Line_item can't be blank/i)
    end

    it 'validates unpurchased cart' do
      @cart.update!(purchased_at: 1.day.ago)
      service = UpdateLineItemService.new(@line_item, @cart, @item, 1)
      expect{ service.perform! }.to raise_error(ServiceError, /transaction already in progress/i)
    end

    shared_examples_for 'it updates a line item in the cart' do
      it 'should update an existing line item' do
        service = UpdateLineItemService.new(@line_item, @cart, @item, 5)
        service.perform!
        expect(@cart.line_items.count).to eq(1)
        expect(@cart.line_items.first.quantity).to eq(5)
        expect(@cart.line_items.first.source).to eq(@item)
      end

      it 'should destroy a line item with 0 quantity' do
        service = UpdateLineItemService.new(@line_item, @cart, @item, 0)
        service.perform!
        expect(@cart.line_items.count).to eq(0)
      end

      it 'raises an error if no line item is found' do
        service = UpdateLineItemService.new(nil, @cart, @item, 1)
        expect{ service.perform! }.to raise_error(ServiceError, /line_item can't be blank/i)
      end
    end

  end
end
