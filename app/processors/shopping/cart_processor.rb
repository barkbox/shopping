module Shopping
  class CartProcessor < BaseProcessor

    before_show do
      cart = Shopping::Cart.find(params[:id])
      if cart.user_id.present? && cart.user_id != resource_owner_id
        # error = JSONAPI::Error.new( { status: :forbidden, code: JSONAPI::FORBIDDEN } )
        # render json: { errors: [error] }, status: 403
        raise Shopping::NotAuthorizedError.new('not authorized', resource_klass: Shopping::Cart)
      end
    end

  end
end
