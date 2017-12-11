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

      other_cart = Cart.where(origin: cart.origin, failed_at: nil, purchased_at: nil, user_id: cart.user_id).where.not(id: cart.id).first
      if other_cart.present? && other_cart.cart_purchases.incomplete.exists?
        raise Shopping::PurchaseInProgressError.new("cannot purchase this cart while another purchase is in progress", resource_klass: Shopping::CartPurchase)
      end

      begin
        resource = resource_klass.create(context)
        result = resource.replace_fields({type: 'cart_purchases', attributes: params[:data][:attributes]})
        service = Shopping.config.purchase_cart_service_class.new(cart, resource)
        service.perform!
        return JSONAPI::ResourceOperationResult.new((result == :completed ? :created : :accepted), resource, result_options)
      rescue ActiveRecord::RecordNotFound => e
        resource.options = resource.options.merge({error: {class: e.class.name, message: e.message}})
        resource.failed_at = Time.zone.now
        resource.send(:save)
        return json_api_error(400, JSONAPI::Exceptions::BadRequest.new(e))
      rescue => e
        resource.options = resource.options.merge({error: {class: e.class.name, message: e.message}})
        resource.failed_at = Time.zone.now
        resource.send(:save)
        return handle_error(e)
      end
    end

    private

    def handle_error(e)
      if e.status_code
        return json_api_error(e.status_code, JSONAPI::Exceptions::BadRequest.new(e))
      else
        return json_api_error(500,  JSONAPI::Exceptions::InternalServerError.new(e, internal_server_error_overrides))
      end
    end

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
