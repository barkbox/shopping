FactoryGirl.define do
  factory :item do
    sequence(:id) { |n| n  }
    sku "IMASKU"
    price 5.0
    list_price 5.0
    sale_price 4.0
    type "Item"
  end
end
