module Shopping
  class LineItem < ActiveRecord::Base    
    # belongs_to :cart
    belongs_to :source, polymorphic: true
  end
end
