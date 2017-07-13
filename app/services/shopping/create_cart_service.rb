module Shopping
  class CreateCartService < Shopping::BaseService

    def initialize(params={})
      @params = params
    end

    def perform!
      Shopping::Cart.create!(@params)
    end
  end
end
