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

    describe '#retry!' do
      context 'when the cart_purchase has succeeded' do
        it "throws an error" do
          cart_purchase.succeed!
          expect{cart_purchase.retry!}.to raise_error(ActiveRecord::RecordInvalid)
        end
      end

      context 'when the cart_purchase is open' do
        it "throws an error" do
          cart_purchase.save!
          expect{cart_purchase.retry!}.to raise_error(ActiveRecord::RecordInvalid)
        end
      end

      context "when the cart_purchase has failed" do
        
        class FakePurchaseCartService
          attr_accessor :cart, :options
          def initialize(cart_id, options)
            @options = options
            @cart = Shopping::Cart.find(cart_id)
            @cp = @cart.cart_purchases.incomplete.last
          end

          def perform!
            @cart.failed_at = nil
            @cart.save!
            @cart.purchased_at = Time.zone.now
            @cart.save!
            @cp.succeed!
          end

        end

        it "retries the cart purchase" do
          options = {"fake_token" =>  'my token', "some_other_stuff" => { "in_here" => 'yeah'}}
          allow(Shopping.config).to receive(:purchase_cart_service_class).and_return(FakePurchaseCartService)
          cart_purchase.options = options
          cart_purchase.save!
          cart_purchase.fail!
          cart_purchase.retry!

          new_cp = Shopping::CartPurchase.last
          expect(new_cp.succeeded_at).to be_present
          expect(cart.reload.purchased_at).to be_present
        end
      end
    end

  end
end
