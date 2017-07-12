module Shopping
  class GetCartService < Shopping::BaseService
    
    def initialize query
      @query = query
    end

    def perform!
      params = query.is_a?(Integer) ? {id: query} : query

      Shopping::Cart.where(params).first
    end
  end
end
