FactoryGirl.define do
  factory :cart, class: Shopping::Cart do
    sequence(:user_id) {|n| n} 
  end
end
