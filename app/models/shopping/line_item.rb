module Shopping
  class LineItem < ActiveRecord::Base    
    belongs_to :cart
    belongs_to :source, polymorphic: true
    
    validate :unique_source_and_cart, on: :create
    validate :unpurchased_cart
    
    validates :quantity, allow_nil: true, numericality: {only_integer: true, greater_than: -1}
    validates :cart_id, presence: true
    validates :source_id, presence: true
    validates :source_type, presence: true
    validates :list_price, presence: true, numericality: true
    validates :sale_price, presence: true, numericality: true

    def unique_source_and_cart
      other = Shopping::LineItem.where(source_id: self.source_id, source_type: self.source_type, cart_id: self.cart_id)
      if other.count > 0
        self.errors.add(:source, "A line item with identical source and cart exists, update quantity instead (id=#{other.first.id})")
      end
    end

    def unpurchased_cart
      if cart && cart.purchased?
        changes.keys.each do |k|
          self.errors.add(k, "Cannot change `#{k}', cart is purchased")
        end
      end
    end

    def self.method_missing(name, *args, &block)
      return if name == :attr_accessible
      super(name, *args, &block)
    end

    attr_accessible :cart_id, :source_id, :source_type, :quantity, :list_price, :sale_price, :meta
  end
end
