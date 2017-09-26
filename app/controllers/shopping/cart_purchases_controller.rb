module Shopping
  class CartPurchasesController < ApiController
    before_action :hello

    def hello
      # binding.pry
    end

# DONT DO THIS
# lean on the resource and not controller
    # def show
    #   cart_purchase = CartPurchase.find(params[:id])
    #   binding.pry
    #   if @current_user.id == cart_purchase.cart.user_id
    #     super
    #   else
    #     raise "FAIL: #{__FILE__} #{__METHOD__}"
    #   end
    # end

# DONT DO THIS
# lean on the resource and not controller
    # def update
      # need to verify that user is
      #   logged in
      #   cart owner

      # # params = params[:data][:attributes]
      # cart = Cart.where(user_id: params[:user_id], id: params[:id]).first
      # cart.update_attributes!(params[:attributes])
      # super
    # end
  end
end
