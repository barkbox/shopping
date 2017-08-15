module Shopping
  class CartPurchaseResource < JSONAPI::Resource
    model_name 'Shopping::CartPurchase'
    
    attributes :cart_id, :created_at, :succeeded_at, :failed_at
    has_one :cart

    def self.updatable_fields(context)
      super - [:cart_id, :updated_at, :created_at, :succeeded_at, :failed_at]
    end

    def self.creatable_fields(context)
      super - [:updated_at, :created_at, :succeeded_at, :failed_at]
    end
    
  end
end