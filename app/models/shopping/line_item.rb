module Shopping
  class LineItem < ActiveRecord::Base    
    belongs_to :cart
    belongs_to :source, polymorphic: true
    validates :quantity, allow_nil: false, numericality: {only_integer: true, greater_than: -1}
    validate :unique_source_and_cart, on: :create
    after_initialize :set_defaults

    def set_defaults
      self.quantity ||= 1
    end

    def unique_source_and_cart
      other = Shopping::LineItem.where(source_id: self.source_id, source_type: self.source_type, cart_id: self.cart_id)
      if other.count > 0
        self.errors.add(:source, "A line item with identical source and cart exists, update quantity instead (id=#{other.first.id})")
      end
    end

  end
end
