module Shopping
  class LineItemsController < ApiController

    def create
      @cart = Cart.find(params[:cart_id])
      @source = Item.find(id: params[:line_item][:source_id])
      quantity = params[:quantity]
      service = AddLineItemService.new(cart, source, quantity)
      @line_item = service.perform!
    end

    def update
      @cart = Cart.find(params[:cart_id])
      @source = Item.find(id: params[:line_item][:source_id])
      @line_item = LineItem.find(params[:id])
      quantity = params[:quantity]
      service = AddLineItemService.new(line_item, cart, source, quantity)
      service.perform!
    end
    
  end
end
