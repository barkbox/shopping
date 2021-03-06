require 'jsonapi-resources'

JSONAPI.configure do |config|
  config.json_key_format = :underscored_key
  config.route_format = :underscored_route
  config.exception_class_whitelist << Shopping::NotAuthorizedError
end