module Shopping
  class CartsController < ApiController
    
    def show
      cart = Cart.find(params[:id])
      render json: cart, include: params[:include], serializer: Shopping::CartSerializer
    end

    # def update
    # end
  end
end
