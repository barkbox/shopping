module Shopping
  class LineItemSerializer < ActiveModel::Serializer
    attributes  :sale_price, 
                :list_price,
                :quantity,
                :created_at, 
                :updated_at

    belongs_to :source
  end
end
