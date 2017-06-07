module Shopping
  class CreateCartService < Shopping::BaseService

    def perform!
      Shopping::Cart.create
    end
  end
end
