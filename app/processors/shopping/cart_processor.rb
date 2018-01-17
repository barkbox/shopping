module Shopping
  class CartProcessor < BaseProcessor

    before_create_resource do
      user_id = params[:data][:attributes][:user_id]
      if user_id.present? && user_id != resource_owner_id
        raise Shopping::NotAuthorizedError.new('not authorized', resource_klass: Shopping::Cart)
      end
    end

    before_show do
      cart = Shopping::Cart.find(params[:id]) rescue nil
      if cart.present? && cart.user_id.present? && cart.user_id != resource_owner_id
        raise Shopping::NotAuthorizedError.new('not authorized', resource_klass: Shopping::Cart)
      end
    end

    before_find do
      if params[:filters] && params[:filters][:user_id]
        verify_user_id(params[:filters][:user_id].to_i)
      end
    end

    before_replace_fields do
      cart = Shopping::Cart.find(params[:resource_id]) rescue nil
      
      if cart.present?
        if cart.user_id.present? && cart.user_id != resource_owner_id
          raise Shopping::NotAuthorizedError.new('not authorized', resource_klass: Shopping::Cart)
        end

        if params[:data][:attributes][:user_id].present? && resource_owner_id != params[:data][:attributes][:user_id]
          raise Shopping::NotAuthorizedError.new('not authorized', resource_klass: Shopping::Cart)
        end
      end

    end

    private

    def verify_user_id(user_id)
      if resource_owner_id != user_id
        raise Shopping::NotAuthorizedError.new('not authorized', resource_klass: Shopping::Cart)
      end
    end

  end
end
