module Shopping
  class Cart < ActiveRecord::Base
    MUTABLE_WHILE_LOCKED = %w(locked_at failed_at purchased_at)
    has_many :line_items

    validate :cannot_alter_locked_cart, :cannot_alter_purchased_cart

    def self.method_missing(name, *args, &block)
      return if name == :attr_accessible
      super(name, *args, &block)
    end

    attr_accessible :user_id, :order_id, :purchased_at, :origin, :locked_at

    def purchased?
      purchased_at.present?
    end

    def locked?
      self.locked_at.present?
    end

    def lock!
      self.locked_at = Time.zone.now
      save!
    end

    def unlock!
      self.locked_at = nil
      save!
    end

    private

    def cannot_alter_purchased_cart
      if self.purchased?
        unless self.changed_attributes.keys.include?("purchased_at") && self.changed_attributes["purchased_at"] == nil
          self.errors.add(:purchased_at, "Can't change state of purchased cart")
        end
      end
    end

    def cannot_alter_locked_cart
      if locked?
        changes.keys.each do |k|
          self.errors.add(k, "Cannot change `#{k}' of locked cart") unless MUTABLE_WHILE_LOCKED.include?(k)
        end
      end
    end

  end
end
