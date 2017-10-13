module Shopping
  class ApiController < ApplicationController
    include JSONAPI::ActsAsResourceController
    rescue_from Shopping::NotAuthorizedError, with: :reject_forbidden_request

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
      { resource_owner: resource_owner }
    end

    def resource_owner
      if Shopping.config.current_user_method.respond_to?(:call)
        Shopping.config.current_user_method.call
      elsif Shopping.config.current_user_method.is_a?(Symbol)
        send(Shopping.config.current_user_method)
      else
        nil
      end
    end 
  end
end
