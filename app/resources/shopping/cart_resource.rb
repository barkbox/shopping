module Shopping
  class CartResource < JSONAPI::Resource
    model_name 'Shopping::Cart'
    
    attributes :user_id, :purchased_at, :created_at
    has_many :line_items
    
  end
end