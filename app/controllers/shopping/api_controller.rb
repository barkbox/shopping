module Shopping
  class ApiController < ApplicationController
    around_filter :catch_errors

    def catch_errors
      yield
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: [{
        status: 404,
        title: e.message
      }] }, status: :not_found
    end
  end
end
