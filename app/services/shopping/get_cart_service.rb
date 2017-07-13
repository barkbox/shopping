module Shopping
  class GetCartService < Shopping::BaseService
    
    def initialize query
      @query = query
    end

    def perform!
      if @query.is_a?(Integer)
        Shopping::Cart.find(@query)
      else
        Shopping::Cart.where(@query.first)
      end
    end
  end
end
