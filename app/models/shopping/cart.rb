module Shopping
  class Cart < ActiveRecord::Base
    has_many :line_items

    validate :cannot_lock_purchased_cart

    def self.method_missing(name, *args, &block)
      return if name == :attr_accessible
      super(name, *args, &block)
    end

    attr_accessible :user_id, :order_id, :purchased_at, :origin

    def lock!
      locked_at = Time.zone.now
      save!
    end

    def unlock!
      locked_at = nil
      save!
    end

    private

      def cannot_lock_purchased_cart
        errors.add(:locked_at, "Can't change lock state of purchased cart") if changes.keys.include?(:locked_at) && cart.purchased?
      end
  end
end
