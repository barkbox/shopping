module Shopping
  class CartPurchaseResource < JSONAPI::Resource
    model_name 'Shopping::CartPurchase'

    attributes :cart_id, :created_at, :succeeded_at, :failed_at, :options
    has_one :cart

    # def fetchable_fields
    #   # check if has a user actually
    #   if @model.cart.user_id == context[:resource_owner].id
    #     super
    #   else
    #     # TODO figure out exactly what to return
    #     raise 'not authorized'
    #   end

      # binding.pry
    # end

    def self.updatable_fields(context)
      super - [:cart_id, :updated_at, :created_at, :succeeded_at, :failed_at]
    end

    def self.creatable_fields(context)
      [:cart_id, :options]
    end
  end
end