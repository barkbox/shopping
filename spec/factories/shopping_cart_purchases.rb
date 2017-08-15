FactoryGirl.define do
  factory :cart_purchase, class: 'Shopping::CartPurchase' do
    succeeded_at nil
    failed_at nil
  end
end
