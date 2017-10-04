module Shopping
  class ApiController < ApplicationController
    include JSONAPI::ActsAsResourceController
    protect_from_forgery with: :null_session
    rescue_from Shopping::NotAuthorizedError, with: :reject_forbidden_request

    # before_action :verify_content_type_header

    # before_action :doorkeeper_authorize!
    # if this is inheriting from the host ApplicationController
    # does it have access to current user?

    def reject_forbidden_request(e)
      type = e.resource_klass.name.underscore.humanize(capitalize: false)
      action = params[:action].humanize(capitalize: false)
      error = JSONAPI::Error.new(
        code: JSONAPI::FORBIDDEN,
        status: :forbidden,
        title: "#{action.titleize} Forbidden",
        detail: "You don't have permission to #{action} this #{type}.",
      )

      render json: { errors: [error] }, status: 403
    end

    def context
      # why not just put in current_user here
      # https://github.com/cerebris/jsonapi-resources/issues/580
      { resource_owner: Shopping.config.current_user_method.call }
    end
  end
end
