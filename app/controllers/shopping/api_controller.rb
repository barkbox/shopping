module Shopping
  class ApiController < ApplicationController
    include JSONAPI::ActsAsResourceController
    protect_from_forgery with: :null_session

    def context
      { resource_owner: Shopping.config.current_user_method.call }
    end
  end
end
