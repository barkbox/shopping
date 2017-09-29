module Shopping
  class CartPurchaseProcessor < JSONAPI::Processor

    def create_resource
      cart_id = params[:data][:attributes][:cart_id]

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
