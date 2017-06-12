Shopping.configure do |config|
  config.logger Rails.logger
  config.current_user_method -> { nil }
end
