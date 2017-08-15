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
    
      it "must be unpurchased at time of creation" do
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
    
    describe "failed_at" do
      let(:cart_purchase){ create(:cart_purchase, cart_id: cart.id, failed_at: Time.zone.now )}
      it "locks the cart purchase when set" do
        expect{cart_purchase.update!({succeeded_at: Time.zone.now})}.to raise_error(ActiveRecord::RecordInvalid)
      end
    end

  end
end
