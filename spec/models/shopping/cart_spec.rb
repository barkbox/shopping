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
          expect{ cart.unlock! }.to raise_error(ActiveRecord::RecordInvalid)
        end
      end
    end

  end
end
