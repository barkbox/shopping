module Shopping
  class ApiController < ApplicationController
    include JSONAPI::ActsAsResourceController
    protect_from_forgery with: :null_session
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

  def context
    { resource_owner: current_user }
  end
  
end
