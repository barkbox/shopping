module Shopping
  class CartsController < ApiController
    
    def show
      cart = Cart.find(params[:id])
      render json: cart, serializer: Shopping::CartSerializer
    end

    # def update
    # end
  end
end
