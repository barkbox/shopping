module Shopping
  class CartPurchase < ActiveRecord::Base
    MUTABLE_PROPERTIES = %w(canceled_at).freeze

    extend Shopping::AttributeAccessibleHelper
    belongs_to :cart

    validates :cart_id, presence: true
    validate :no_other_successful_purchase
    validate :not_failed
    validate :can_cancel
    validate :only_updating_mutable

    attr_accessible :cart_id, :succeeded_at, :failed_at, :options

    def canceled?
      self.canceled_at.present?
    end

    def failed?
      self.failed_at.present?
    end

    def successful?
      self.succeeded_at.present?
    end

    def incomplete?
      self.succeeded_at.nil? && self.failed_at.nil?
    end

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

    def no_other_successful_purchase
      if self.new_record? && Shopping::CartPurchase.where('cart_id=? and succeeded_at is not null', self.cart_id).exists?
        self.errors.add(:cart, 'must not have a successful cart purchase')
      end
    end

    def only_updating_mutable
      if self.persisted? && self.successful? && self.changed_attributes.keys.any?{|k| !MUTABLE_PROPERTIES.include?(k) }
        self.errors.add(:succeeded_at, 'only mutable properties may be changed on a successful cart purchase')
      end
    end

    def not_failed
      if self.failed_at.present? && !(self.changed_attributes.keys.include?("failed_at") && self.changed_attributes["failed_at"] == nil)
        self.errors.add(:failed_at, 'cannot update failed cart purchase')
      end
    end

    def can_cancel
      if self.changed_attributes.keys.include?("canceled_at")
        if !self.successful? || !self.changed_attributes["canceled_at"].nil?
          self.errors.add(:canceled_at, 'only successful, uncanceled cart purchases may be canceled')
        end
      end
    end
  end
end
