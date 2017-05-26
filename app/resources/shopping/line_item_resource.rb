module Shopping
  class LineItemResource < JSONAPI::Resource
    model_name 'Shopping::LineItem'
    
    attributes :cart_id, :sale_price, :list_price, :quantity, :created_at, :updated_at
    has_one :source, polymorphic: true
    has_one :cart
  end
end