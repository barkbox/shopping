FactoryGirl.define do
  factory :line_item, class: Shopping::LineItem do
    list_price 5.0
    sale_price 5.0
    quantity   1
  end
end
