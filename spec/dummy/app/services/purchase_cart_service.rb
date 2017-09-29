class PurchaseCartService
    cattr_reader :error_to_throw
    
    def initialize(cart_id, params)
    end

    def perform!
      if error_to_throw.present?
        raise error_to_throw
      end  
    end

    def self.throw_error(error_to_throw)
      @@error_to_throw = error_to_throw
    end

end

