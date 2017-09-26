module Shopping
  class ApiController < ApplicationController
    include JSONAPI::ActsAsResourceController
    protect_from_forgery with: :null_session

    # before_action :verify_content_type_header

    before_action :doorkeeper_authorize!
    # if this is inheriting from the host ApplicationController
    # does it have access to current user?

    def context
      # why not just put in current_user here
      # https://github.com/cerebris/jsonapi-resources/issues/580
      { resource_owner: Shopping.config.current_user_method.call }
    end
  end
end
