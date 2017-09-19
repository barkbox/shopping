Shopping.configure do |config|
  config.logger Rails.logger
  config.current_user_method -> { nil }
  config.purchase_cart_service_class PurchaseCartService
end
