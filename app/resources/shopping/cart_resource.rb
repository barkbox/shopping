module Shopping
  class CartResource < JSONAPI::Resource
    attributes :user_id, :purchased_at, :created_at
    has_many :line_items
    model_name 'Shopping::Cart'
    
  end
end