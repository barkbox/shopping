FactoryGirl.define do
  factory :item do
    sequence(:id) { |n| n  }
    price 5.0
  end
end
