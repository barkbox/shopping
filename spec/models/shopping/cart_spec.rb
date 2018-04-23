require 'rails_helper'

module Shopping
  RSpec.describe Cart, type: :model do
    let(:cart){ create(:cart) }

    describe "lock!" do

      it "sets the locked_at property of the cart" do
        expect{cart.lock!}.to change{cart.locked_at}.from(nil).to(an_instance_of(ActiveSupport::TimeWithZone))
      end

      it "prevents further changes to the cart" do
        cart.lock!
        expect{cart.update!({user_id: 45})}.to raise_error(ActiveRecord::RecordInvalid)
      end

      context "when the cart has been purchased" do
        before{ cart.update!({purchased_at: Time.zone.now })}

        it "raises an error" do
          expect{ cart.lock! }.to raise_error(ActiveRecord::RecordInvalid)
        end
      end
    end

    describe "unlock!" do
      before{ cart.lock! }

      it "unsets the locked_at property of the cart" do
        expect{cart.unlock!}.to change{cart.locked_at}.from(an_instance_of(ActiveSupport::TimeWithZone)).to(nil)
      end

      context "when the cart has been purchased" do
        before{ cart.update!({purchased_at: Time.zone.now })}

        it "raises an error" do
          expect{ cart.reload.unlock! }.to raise_error(ActiveRecord::RecordInvalid)
        end
      end
    end

    describe "#canceled?" do
      it "returns true if the cart has any canceled purchases" do
        create(:cart_purchase, cart_id: cart.id, succeeded_at: Time.zone.now, canceled_at: Time.zone.now)
        expect(cart).to be_canceled
      end
    end

    describe ".canceled" do
      it "only returns canceled carts" do
        cart_2 = create(:cart)
        create(:cart_purchase, cart_id: cart_2.id, failed_at: Time.zone.now)
        create(:cart_purchase, cart_id: cart_2.id, succeeded_at: Time.zone.now, canceled_at: Time.zone.now)

        carts = Shopping::Cart.canceled

        expect(carts).to include(cart_2)
        expect(carts).to_not include(cart)
      end
    end

    describe "purchased_at" do
      before{ cart.lock!; cart.update!(purchased_at: Time.zone.now)}

      it "prevents any changes to the instance when set" do
        expect{cart.update!({user_id: 100000})}.to raise_error(ActiveRecord::RecordInvalid)
        expect{cart.update!({order_id: 100000})}.to raise_error(ActiveRecord::RecordInvalid)
        expect{cart.update!({purchased_at: Time.zone.now})}.to raise_error(ActiveRecord::RecordInvalid)
      end
    end

  end
end
