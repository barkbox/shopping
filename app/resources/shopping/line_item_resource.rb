module Shopping
  class LineItemResource < JSONAPI::Resource
    attributes :cart_id, :sale_price, :list_price, :quantity, :created_at, :updated_at
    has_one :source, polymorphic: true
    has_one :cart
    model_name 'Shopping::LineItem'
  end
end