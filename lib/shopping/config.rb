module Shopping
  class Config
    def logger(logger=nil)
      @logger ||= logger
    end

    def current_user_method(callable=nil)
      # @current_user ||= callable

      # @current_user ||= User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
      user = Struct.new(:id)
      @current_user ||= lambda { user.new(123) }
    end

    def purchase_cart_service_class(klass=nil)
      @purchase_cart_service_class ||= (klass.is_a?(Class) ? klass : constantize(klass))
    end
  end
end
