FactoryGirl.define do
  factory :item do
    sequence(:id) { |n| n  }
    sku "IMASKU"
    price 5.0
    type "Item"
    name "An Item"
  end
end
