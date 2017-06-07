FactoryGirl.define do
  factory :line_item, class: Shopping::LineItem do
    cart
    source factory: :item
    list_price 5.0
    sale_price 5.0
    quantity   1
  end
end
