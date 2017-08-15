module Shopping
  class CartPurchase < ActiveRecord::Base
    extend Shopping::AttributeAccessibleHelper
    belongs_to :cart

    validates :cart_id, presence: true
    validate :unpurchased_cart
    validate :not_failed

    attr_accessible :cart_id, :succeeded_at, :failed_at

    def fail!
      self.update!({failed_at: Time.zone.now})
    end

    def succeed!
      self.update!({succeeded_at: Time.zone.now})
    end

    def self.incomplete
      self.where(succeeded_at: nil, failed_at: nil)
    end

    def self.failed
      self.where.not(failed_at: nil)
    end

    def self.successful
      self.where.not(succeeded_at: nil)
    end

    private

    def unpurchased_cart
      self.errors.add(:cart, 'must not be purchased') if self.cart.present? && (self.cart.purchased? || Shopping::CartPurchase.where('cart_id=? and succeeded_at is not null', self.cart_id).exists?)
    end

    def not_failed
      if self.failed_at.present? && !(self.changed_attributes.keys.include?("failed_at") && self.changed_attributes["failed_at"] == nil)
        self.errors.add(:failed_at, 'cannot update failed cart purchase')
      end
    end
    
  end
end
