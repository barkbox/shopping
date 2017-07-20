module Shopping
  class Cart < ActiveRecord::Base
    has_many :line_items

    def self.method_missing(name, *args, &block)
      return if name == :attr_accessible
      super(name, *args, &block)
    end

    attr_accessible :user_id, :order_id, :purchased_at, :origin
  end
end
