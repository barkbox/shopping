module Shopping
  class CartPurchaseProcessor < JSONAPI::Processor

    def create_resource
      cart_id = params[:data][:attributes][:cart_id]

      begin
        service = Shopping.config.purchase_cart_service_class.new(cart_id, params[:data][:attributes])
        service.perform!
      rescue => e
        return JSONAPI::ErrorsOperationResult.new(400, [e], {})
      end

      resource = resource_klass.create(context)
      result = resource.replace_fields({type: 'cart_purchases', attributes: {cart_id: cart_id}})
      return JSONAPI::ResourceOperationResult.new((result == :completed ? :created : :accepted), resource, result_options)
    end

  end
end
