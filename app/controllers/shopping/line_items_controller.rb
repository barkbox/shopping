module Shopping
  class LineItemsController < ApiController

    def create
      if cart_id = line_item_params[:cart_id]
        cart = Cart.find(cart_id)
      else
        cart = Cart.create
      end
      source = line_item_params[:source_type].constantize.find(line_item_params[:source_id])
      quantity = (line_item_params[:quantity] || 1).to_i
      AddLineItemService.new(cart, source, quantity).perform!
      render json: cart, include: :line_items, serializer: Shopping::CartSerializer, status: 200
    end

    def update
      cart = line_item.cart
      source = line_item.source
      quantity = (line_item_params[:quantity] || 0).to_i
      UpdateLineItemService.new(cart, source, quantity).perform!
      render json: cart, include: :line_items, serializer: Shopping::CartSerializer, status: 200
    end

    def destroy
      line_item.destroy
      render json: line_item.cart, include: :line_items, serializer: Shopping::CartSerializer, status: 200
    end

    private

      def line_item
        @line_item ||= LineItem.find(params[:id])
      end

      def line_item_params
        params.require(:data)
              .require(:attributes)
              .permit(:cart_id, :source_id, :source_type, :quantity)
      end
  end
end
