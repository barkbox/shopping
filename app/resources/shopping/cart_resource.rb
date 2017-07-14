module Shopping
  class CartResource < JSONAPI::Resource
    model_name 'Shopping::Cart'
    
    attributes :user_id, :purchased_at, :created_at, :updated_at, :origin
    has_many :line_items

    def self.updatable_fields(context)
      super - [:user_id, :updated_at, :created_at, :purchased_at, :origin]
    end

    def self.creatable_fields(context)
      super - [:updated_at, :created_at, :purchased_at]
    end
    
  end
end