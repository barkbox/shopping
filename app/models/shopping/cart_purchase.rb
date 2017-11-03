module Shopping
  class CartPurchase < ActiveRecord::Base
    extend Shopping::AttributeAccessibleHelper
    belongs_to :cart

    validates :cart_id, presence: true
    validate :unpurchased_cart
    validate :not_failed

    attr_accessible :cart_id, :succeeded_at, :failed_at, :options

    def fail!
      self.update!({failed_at: Time.zone.now})
    end

    def succeed!
      self.update!({succeeded_at: Time.zone.now})
    end

    def retry!
      if(self.new_record? || self.succeeded_at.present? || !self.failed_at.present?)
        self.errors.add(:retry, "cannot retry open or successful cart purchases")
        raise ActiveRecord::RecordInvalid.new(self)
      end

      new_cart_purchase = Shopping::CartPurchase.create!(cart_id: self.cart_id, options: self.options)
      service = Shopping.config.purchase_cart_service_class.new(self.cart_id, self.options)
      service.perform!
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
      if self.cart.present? && Shopping::CartPurchase.where('cart_id=? and succeeded_at is not null', self.cart_id).exists?
        self.errors.add(:cart, 'must not have a successful cart purchase') 
      end
    end

    def not_failed
      if self.failed_at.present? && !(self.changed_attributes.keys.include?("failed_at") && self.changed_attributes["failed_at"] == nil)
        self.errors.add(:failed_at, 'cannot update failed cart purchase')
      end
    end
    
  end
end
