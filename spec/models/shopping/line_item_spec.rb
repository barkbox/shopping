require 'rails_helper'

module Shopping
  RSpec.describe LineItem, type: :model do

    let(:line_item){ build(:line_item) }

    context "validations" do
      describe "quantity" do
        it "must be an integer greater than or equal to zero" do
          line_item.quantity = -1
          expect{line_item.save!}.to raise_error(ActiveRecord::RecordInvalid)
          line_item.quantity = 1.1
          expect{line_item.save!}.to raise_error(ActiveRecord::RecordInvalid)
          line_item.quantity = 0
          expect(line_item.save!).to eq(true)
        end
      end

      describe "source/cart combination" do
        let(:dupe){create(:line_item, source: line_item.source, cart: line_item.cart)}

        it "must be unique" do
          expect{line_item.save!}.to raise_error(ActiveRecord::RecordInvalid, /A line item with identical source and cart exists, update quantity instead \(id=#{dupe.id}\)/i)
        end
      end

      describe "source" do
        it "must be present" do
          line_item.source = nil
          expect{line_item.save!}.to raise_error(ActiveRecord::RecordInvalid)
        end
      end

      describe "cart" do
        it "must be present" do
          line_item.cart = nil
          expect{line_item.save!}.to raise_error(ActiveRecord::RecordInvalid)
        end
      end

      describe "purchased cart" do
        it "should prevent any line item changes" do
          line_item.save
          line_item.cart.update!(purchased_at: Time.zone.now)
          line_item.quantity = line_item.quantity + 1
          expect{line_item.save!}.to raise_error(ActiveRecord::RecordInvalid, /Cannot change `quantity', cart is purchased/i)
        end
      end
    end

    describe "list price and sale price" do
      it "should be set from the source price if present" do
        source = line_item.source
        line_item.save!
        expect(line_item.sale_price).to be_present
        expect(line_item.list_price).to be_present
        expect(line_item.sale_price).to eq(source.price)
        expect(line_item.list_price).to eq(source.price)
      end
    end

    describe "source_name" do
      it "should be set from the source's name if present" do
        source = line_item.source
        line_item.save!
        expect(line_item.source_name).to eq(source.name)
        expect(line_item.source_name).to be_present
      end
    end

  end
end
