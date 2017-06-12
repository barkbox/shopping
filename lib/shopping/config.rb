module Shopping
  class Config

    def logger(logger=nil)
      @logger ||= logger
    end

    def current_user_method(callable=nil)
      @current_user ||= callable
    end
  end
end
