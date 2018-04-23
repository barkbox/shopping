module Shopping
  class Cart < ActiveRecord::Base
    extend Shopping::AttributeAccessibleHelper
    MUTABLE_WHILE_LOCKED = %w(locked_at failed_at purchased_at)
    has_many :line_items
    has_many :cart_purchases

    validate :cannot_alter_locked_cart, :cannot_alter_purchased_cart

    attr_accessible :user_id, :order_id, :purchased_at, :origin, :locked_at, :options

    default_scope { order(created_at: :desc) }
    scope :purchased, ->{ where.not(purchased_at: nil) }
    scope :failed, ->{ where.not(failed_at: nil).where(purchased_at: nil) }
    scope :open, -> { where(failed_at: nil, purchased_at: nil) }
    scope :canceled, -> {
      joins('left join shopping_cart_purchases on shopping_cart_purchases.cart_id = shopping_carts.id')
      .where('shopping_cart_purchases.canceled_at is not null')
    }

    def purchased?
      self.purchased_at.present?
    end

    def failed?
      self.failed_at.present?
    end

    def locked?
      self.locked_at.present?
    end

    def canceled?
      self.cart_purchases.where.not(canceled_at: nil).exists?
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
