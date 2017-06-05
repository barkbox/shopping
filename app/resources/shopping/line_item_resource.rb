module Shopping
  class LineItemResource < JSONAPI::Resource
    model_name 'Shopping::LineItem'
    
    attributes :cart_id, 
               :sale_price, 
               :list_price, 
               :quantity, 
               :created_at, 
               :updated_at, 
               :source_id, 
               :source_type, 
               :source_sku

    has_one :cart

    def source_sku
      @model.source.sku
    end
  end
end