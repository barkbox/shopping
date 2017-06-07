require 'rails_helper'
 
describe Shopping::AddLineItemService do
  before do 
    @cart = create(:cart)
    @item = create(:item)
  end

  describe '#perform!' do
    it 'validates presence of cart' do
      service = Shopping::AddLineItemService.new(nil, @item)
      expect{ service.perform! }.to raise_error(ServiceError, /cart can't be blank/i)
    end

    it 'validates presence of source' do
      service = Shopping::AddLineItemService.new(@cart, nil)
      expect{ service.perform! }.to raise_error(ServiceError, /source can't be blank/i)
    end

    it 'validates unpurchased cart' do
      service = Shopping::AddLineItemService.new(create(:cart, purchased_at: 1.day.ago), @item)
      expect{ service.perform! }.to raise_error(ServiceError, /transaction already in progress/i)
    end

    it 'validates quantity value' do
      service = Shopping::AddLineItemService.new(create(:cart), @item, 0)
      expect{ service.perform! }.to raise_error(ServiceError, /greater than 0/i)
    end

    shared_examples_for 'it adds an item to the cart' do
      it 'should create a new line item' do
        service = Shopping::AddLineItemService.new(cart, source)
        service.perform!
        expect(cart.line_items.count).to eq(1)
        expect(cart.line_items.first.quantity).to eq(1)
        expect(cart.line_items.first.source).to eq(source)
        expect(cart.line_items.first.sale_price).to eq(source.price)
      end

      it 'should create a new line item with a specified quantity' do
        service = Shopping::AddLineItemService.new(cart, source, 2)
        service.perform!
        expect(cart.line_items.count).to eq(1)
        expect(cart.line_items.first.quantity).to eq(2)
        expect(cart.line_items.first.source).to eq(source)
      end

      it 'increments the quantity of an existing line item' do
        cart = create(:cart)
        source = create(:item)
        cart.line_items << create(:line_item, source: source, sale_price: source.price, quantity: 1)
        cart.reload
        service = Shopping::AddLineItemService.new(cart, source)
        service.perform!
        expect(cart.line_items.count).to eq(1)
        expect(cart.line_items.first.quantity).to eq(2)
        expect(cart.line_items.first.source).to eq(source)
      end
    end

    describe 'adding an item to cart' do
      it_should_behave_like 'it adds an item to the cart' do
        let(:cart) { create(:cart) }
        let(:source) { create(:item) }
      end
    end
  end
end
