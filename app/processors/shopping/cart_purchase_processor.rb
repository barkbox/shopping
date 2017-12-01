module Shopping
  class CartPurchaseProcessor < BaseProcessor

    after_show do
      user_id = result.resource.cart.user_id rescue nil
      if !user_id.present? || user_id != resource_owner_id
        raise Shopping::NotAuthorizedError.new('not authorized', resource_klass: Shopping::CartPurchase)
      end
    end

    def create_resource
      cart_id = params[:data][:attributes][:cart_id]
      if !(cart = Cart.find(cart_id)) || !cart.user_id.present? || cart.user_id != resource_owner_id
        raise Shopping::NotAuthorizedError.new('not authorized', resource_klass: Shopping::CartPurchase)
      end

      if (other_cart = Cart.where(origin: cart.origin, failed_at: nil, purchased_at: nil, user_id: cart.user_id).where.not(id: cart.id).first) && other_cart.cart_purchases.incomplete.exists?
        raise Shopping::PurchaseInProgressError.new("cannot purchase this cart while another purchase is in progress", resource_klass: Shopping::CartPurchase)
      end

      begin
        service = Shopping.config.purchase_cart_service_class.new(cart_id, params[:data][:attributes])
        service.perform!
      rescue ActiveRecord::RecordNotFound => e
        return json_api_error(400, JSONAPI::Exceptions::BadRequest.new(e))
      rescue => e
        return json_api_error(500,  JSONAPI::Exceptions::InternalServerError.new(e, internal_server_error_overrides))
      end

      resource = resource_klass.create(context)
      result = resource.replace_fields({type: 'cart_purchases', attributes: params[:data][:attributes]})
      return JSONAPI::ResourceOperationResult.new((result == :completed ? :created : :accepted), resource, result_options)
    end

    private

    def json_api_error(status, exn)
       JSONAPI::ErrorsOperationResult.new(status, exn.errors, {})
    end

    def internal_server_error_overrides
      if Rails.env.test?
        {}
      else
        { meta: {} }
      end
    end
  end
end
