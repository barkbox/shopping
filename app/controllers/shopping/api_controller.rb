module Shopping
  class ApiController < ApplicationController
    include JSONAPI::ActsAsResourceController
    protect_from_forgery with: :null_session
  end

    def context
      { resource_owner: current_user }
    end
end
