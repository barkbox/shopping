module Shopping
  class LineItemProcessor < BaseProcessor

    before_create_resource do
      cart = Cart.find(params[:data][:attributes][:cart_id])
      if cart.present? && cart.user_id.present? && cart.user_id != resource_owner_id
        raise Shopping::NotAuthorizedError.new('not authorized', resource_klass: Shopping::LineItem)
      end
    end

    after_show do
      user_id = result.resource.cart.user_id rescue nil
      if user_id.present? && user_id != resource_owner_id
        raise Shopping::NotAuthorizedError.new('not authorized', resource_klass: Shopping::LineItem)
      end
    end

    before_replace_fields do
      line_item = Shopping::LineItem.find(params[:resource_id]) rescue nil
      cart = line_item.cart
      if cart.present? && cart.user_id.present? && cart.user_id != resource_owner_id
        raise Shopping::NotAuthorizedError.new('not authorized', resource_klass: Shopping::LineItem)
      end
    end
  end
end