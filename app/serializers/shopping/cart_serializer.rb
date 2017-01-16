module Shopping
  class CartSerializer < ActiveModel::Serializer
    attributes  :id,
                :user_id,
                :purchased_at

    has_many :line_items
  end
end
