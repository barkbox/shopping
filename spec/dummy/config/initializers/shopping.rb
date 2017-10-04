Shopping.configure do |config|
  config.logger Rails.logger

  # do i even need this? am able to call Shopping.configure.current_user_method.call without it
  # do we want this run on initialization? or when the route is hit
    # route > resource > context is automagically fed into applicable method
    # when context is called Shopping::ApiController.context should be run
    # this goes to @current_user ||= callable
  # config.current_user_method -> { nil }
  # config.current_user_method

  config.purchase_cart_service_class PurchaseCartService
end
