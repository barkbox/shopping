module Shopping
  class ApiController < ApplicationController
    around_filter :catch_errors

    def catch_errors
      yield
    rescue ActiveRecord::RecordNotFound => e
      json = {
        :errors => [
          {
            status: '404',
            title:  'Not found'
          }
        ]
      }
      render json: json, status: :not_found
    end
  end
end
