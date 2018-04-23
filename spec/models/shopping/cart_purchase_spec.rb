require 'rails_helper'

module Shopping
  RSpec.describe CartPurchase, type: :model do

    let(:cart){ create(:cart) }
    let(:cart_purchase){ build(:cart_purchase, cart_id: cart.id) }

    describe "cart" do

      it "must be present" do
        cart_purchase.cart_id = nil
        expect{cart_purchase.save!}.to raise_error(ActiveRecord::RecordInvalid)
      end

      it "must not have any successful cart purchases at time of creation" do
        create(:cart_purchase, cart_id: cart.id, succeeded_at: Time.zone.now)
        cart.update!({purchased_at: Time.zone.now})
        expect{cart_purchase.save!}.to raise_error(ActiveRecord::RecordInvalid)
      end

    end

    describe "succeeded_at" do
      let(:cart_purchase){ create(:cart_purchase, cart_id: cart.id, succeeded_at: Time.zone.now)}

      it "locks the cart purchase when set" do
        expect{cart_purchase.update!({failed_at: Time.zone.now})}.to raise_error(ActiveRecord::RecordInvalid)
      end

      it "prevents the creation of other cart purchases on the cart when set" do
        expect{create(:cart_purchase, cart_id: cart_purchase.cart_id)}.to raise_error(ActiveRecord::RecordInvalid)
      end

    end

    describe "canceled_at" do
      it "can't be set on an unsuccessful cart purchase" do
        cart_purchase.canceled_at = Time.zone.now
        expect{cart_purchase.save!}.to raise_error(ActiveRecord::RecordInvalid)
      end

      it "can be set on a successful cart purchase" do
        cart_purchase.succeeded_at = Time.zone.now
        cart_purchase.save!
        expect{cart_purchase.update!(canceled_at: Time.zone.now)}.to_not raise_error
      end
    end

    describe "failed_at" do
      let(:cart_purchase){ create(:cart_purchase, cart_id: cart.id, failed_at: Time.zone.now )}
      it "locks the cart purchase when set" do
        expect{cart_purchase.update!({succeeded_at: Time.zone.now})}.to raise_error(ActiveRecord::RecordInvalid)
      end
    end

    describe "#fail!" do
      it "marks the cart_purchase as failed" do
        expect{cart_purchase.fail!}.to change{cart_purchase.failed_at}.from(nil).to(an_instance_of(ActiveSupport::TimeWithZone))
      end
    end

    describe "#succeed!" do
      it "marks the cart_purchase as succeeded" do
        expect{cart_purchase.succeed!}.to change{cart_purchase.succeeded_at}.from(nil).to(an_instance_of(ActiveSupport::TimeWithZone))
      end
    end

  end
end
