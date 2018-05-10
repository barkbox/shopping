module Shopping
  class CartProcessor < BaseProcessor

    before_create_resource do
      unless current_user_is_admin?
        user_id = params[:data][:attributes][:user_id]
        if user_id.present? && user_id != resource_owner_id
          raise_unauthorized!
        end
      end
    end

    before_show do
      unless current_user_is_admin?
        cart = Shopping::Cart.find(params[:id]) rescue nil
        if cart.present? && cart.user_id.present? && cart.user_id != resource_owner_id
          raise_unauthorized!
        end
      end
    end

    before_find do
      user_id = user_id_from_filter_params
      if user_id.present?
        verify_user_id(user_id) unless current_user_is_admin?
      elsif resource_owner_id.nil?
        raise_unauthorized!
      end
    end

    after_find do
      user_id = user_id_from_filter_params || resource_owner_id
      result.resources = result.resources.select do |ele|
        ele.user_id == user_id
      end
    end

    before_replace_fields do
      unless current_user_is_admin?
        cart = Shopping::Cart.find(params[:resource_id]) rescue nil

        if cart.present?
          if cart.user_id.present? && cart.user_id != resource_owner_id
            raise_unauthorized!
          end

          user_id = params[:data][:attributes][:user_id]
          if user_id.present? && resource_owner_id != user_id
            raise_unauthorized!
          end
        end
      end
    end

    private

    def raise_unauthorized!
      raise Shopping::NotAuthorizedError.new('not authorized', resource_klass: Shopping::Cart)
    end

    def verify_user_id(user_id)
      if resource_owner_id != user_id
        raise_unauthorized!
      end
    end

    def user_id_from_filter_params
      if params[:filters] && params[:filters][:user_id]
        return params[:filters][:user_id].to_i
      end
    end
  end
end
