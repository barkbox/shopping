module Shopping
  class Cart < ActiveRecord::Base
    attr_accessible :user_id, :order_id, :purchased_at, :origin
    has_many :line_items
  end
end
