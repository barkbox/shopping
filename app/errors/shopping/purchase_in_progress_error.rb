module Shopping
  class PurchaseInProgressError < Exception
    attr_accessor :resource_klass

    def initialize(msg, options={})
      @resource_klass = options[:resource_klass]
      super msg
    end
  end
end
