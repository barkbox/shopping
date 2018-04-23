module Shopping
  class CartPurchaseResource < JSONAPI::Resource
    model_name 'Shopping::CartPurchase'

    attributes :cart_id, :created_at, :succeeded_at, :failed_at, :canceled_at, :options
    has_one :cart

    def source_model
      @model
    end

    def self.updatable_fields(context)
      super - [:cart_id, :updated_at, :created_at, :succeeded_at, :failed_at]
    end

    def self.creatable_fields(context)
      [:cart_id, :options]
    end
  end
end
