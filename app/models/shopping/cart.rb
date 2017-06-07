module Shopping
  class Cart < ActiveRecord::Base
    validates :user_id, presence: true
    has_many :line_items
  end
end
