module Shopping
  class Cart < ActiveRecord::Base
    has_many :line_items
    
    validates :user_id, presence: true
  end
end
