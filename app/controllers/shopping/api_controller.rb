module Shopping
  class ApiController < ApplicationController
    include JSONAPI::ActsAsResourceController
    rescue_from Shopping::NotAuthorizedError, with: :reject_forbidden_request
    rescue_from Shopping::PurchaseInProgressError, with: :reject_duplicate_purchase

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

    def reject_duplicate_purchase(e)
      type = e.resource_klass.name.underscore.humanize(capitalize: false)
      action = params[:action].humanize(capitalize: false)
      error = JSONAPI::Error.new(
        code: JSONAPI::BAD_REQUEST,
        status: :bad_request,
        title: "Bad Request",
        detail: "Cannot purchase while another purchase is in progress"
      )

      render json: { errors: [error] }, status: 400
    end

    def context
      {
        resource_owner: resource_owner,
        is_admin: is_admin?
      }
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

    def is_admin?
      if Shopping.config.admin_method.respond_to?(:call)
        Shopping.config.admin_method.call
      elsif Shopping.config.admin_method.is_a?(Symbol)
        send(Shopping.config.admin_method)
      else
        nil
      end
    end
  end
end
