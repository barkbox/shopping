module Shopping
  class CartProcessor < BaseProcessor

    before_show do
      cart = Shopping::Cart.find(params[:id]) rescue nil
      if cart.present? && cart.user_id.present? && cart.user_id != resource_owner_id
        raise Shopping::NotAuthorizedError.new('not authorized', resource_klass: Shopping::Cart)
      end
    end

  end
end
