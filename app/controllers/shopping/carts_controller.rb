module Shopping
  class CartsController < ApiController

    private

    def cart_params
      params.require(:cart).permit(:user_id, :order_id, :purchased_at, :origin, :locked_at, :options)
    end
  end
end
