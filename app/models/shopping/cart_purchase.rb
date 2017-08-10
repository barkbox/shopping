module Shopping
  class CartPurchase < ActiveRecord::Base
    extend Shopping::AttributeAccessibleHelper
    belongs_to :cart

    validates :cart_id, presence: true
    validate :unpurchased_cart
    validate :not_failed

    attr_accessible :cart_id, :succeeded_at, :failed_at

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
