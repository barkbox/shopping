module Shopping
  class CreateCartService < Shopping::BaseService

    def perform!(params)
      Shopping::Cart.create!(params)
    end
  end
end
