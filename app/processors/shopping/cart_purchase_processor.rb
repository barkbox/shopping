module Shopping
  class CartPurchaseProcessor < BaseProcessor

    before_show do
      # doesnt seem to allow user_id to be passed thru params
      # fetchable_fields is called after this
      cart_purchase = CartPurchase.find(params[:id])
      if cart_purchase.cart.user_id != context[:resource_owner].id
        # raise 'some error object that responds to `status`'
        raise JSONAPI::Error.new( { status: :forbidden, code: JSONAPI::FORBIDDEN } )
      end
    end

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
