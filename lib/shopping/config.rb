module Shopping
  class Config

    def logger(logger=nil)
      @logger ||= logger
    end
  end
end
