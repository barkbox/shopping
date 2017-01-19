module Shopping
  class CartSerializer < ActiveModel::Serializer
    attributes  :id,
                :user_id,
                :purchased_at,
                :created_at

    has_many :line_items
  end
end
