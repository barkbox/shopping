module Shopping
  class LineItemProcessor < BaseProcessor

    before_create_resource do
      unless current_user_is_admin?
        cart = Cart.find(params[:data][:attributes][:cart_id])
        if cart.present? && cart.user_id.present? && cart.user_id != resource_owner_id
          raise_unauthorized!
        end
      end

      if club
        source = Shopping.config.plan_class.find_club_plan(club, existing_source)
        params[:data][:attributes].merge!(
          source_id: source.id,
          source_type: source.class.name)
      end
    end


    after_find do
      unless current_user_is_admin?
        unauthorized = result.resources.any? do |line_item|
          line_item_belongs_to_current_user(line_item)
        end

        if unauthorized
          raise Shopping::NotAuthorizedError.new('not authorized', resource_klass: Shopping::Cart)
        end
      end
    end

    after_show do
      unless current_user_is_admin?
        user_id = result.resource.cart.user_id rescue nil
        if user_id.present? && user_id != resource_owner_id
          raise_unauthorized!
        end
      end
    end

    before_replace_fields do
      unless current_user_is_admin?
        line_item = Shopping::LineItem.find(params[:resource_id]) rescue nil
        cart = line_item.cart
        if cart.present? && cart.user_id.present? && cart.user_id != resource_owner_id
          raise_unauthorized!
        end
      end
    end

    private

    def raise_unauthorized!
      raise Shopping::NotAuthorizedError.new('not authorized', resource_klass: Shopping::LineItem)
    end

    def club
      @_club ||= club_from_params
    end

    def club_from_params
      if params[:data][:attributes][:options]
        params[:data][:attributes][:options].delete(:club)
      end
    end

    def existing_source
      source_id = params[:data][:attributes][:source_id]
      Shopping.config.plan_class.find(source_id)
    end

    def line_item_belongs_to_current_user(line_item)
      cart = line_item.cart
      (cart.present? && cart.user_id.present? && cart.user_id != resource_owner_id)
    end
  end
end
