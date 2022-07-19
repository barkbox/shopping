require 'jsonapi-resources'
require 'app/errors/not_authorized_error'

JSONAPI.configure do |config|
  config.json_key_format = :underscored_key
  config.route_format = :underscored_route
  config.exception_class_whitelist << Shopping::NotAuthorizedError
end
