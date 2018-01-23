FactoryGirl.define do
  factory :line_item, class: Shopping::LineItem do
    cart
    source factory: :item
    quantity   1
  end
end
