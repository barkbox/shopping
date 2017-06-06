require 'rails_helper'

module Shopping
  RSpec.describe LineItem, type: :model do

    let(:line_item){build(:line_item)}

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
        let(:dupe){create(:line_item)}

        it "must be unique" do
          expect{line_item.save!}.to raise_error(ActiveRecord::RecordInvalid, /A line item with identical source and cart exists, update quantity instead \(id=#{dupe.id}\)/i)
        end
      end
    end

  end
end
