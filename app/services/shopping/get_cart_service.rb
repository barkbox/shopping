module Shopping
  class GetCartService < Shopping::BaseService
    
    def initialize query
      @query = query
    end

    def perform!
      if @query.is_a?(Hash)
        Shopping::Cart.where(@query.first)
      else
        Shopping::Cart.find(@query)
      end
    end
  end
end
