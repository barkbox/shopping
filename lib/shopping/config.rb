module Shopping
  class Config
    def logger(logger = nil)
      @logger ||= logger
    end

    def current_user_method(callable = nil)
      @method ||= callable
    end

    def admin_method(callable=nil)
      @method ||= callable
    end

    def purchase_cart_service_class(klass = nil)
      @purchase_cart_service_class ||= (klass.is_a?(Class) ? klass : constantize(klass))
    end

    def plan_class(klass = nil)
      @plan_class ||= klass
    end
  end
end
