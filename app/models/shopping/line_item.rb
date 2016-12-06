module Shopping
  class LineItem < ActiveRecord::Base
    belongs_to :cart
  end
end
