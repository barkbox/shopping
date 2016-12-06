module Shopping
  class Cart < ActiveRecord::Base
    has_many :line_items
  end
end
