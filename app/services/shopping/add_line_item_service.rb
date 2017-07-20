module Shopping
  class AddLineItemService < Shopping::BaseService

    attr_accessor :cart, 
                  :source,
                  :quantity

    validates :cart, :source, presence: true
    validate :unpurchased_cart

    def initialize cart, source, quantity=1, meta={}
      @cart = cart
      @source = source
      @quantity = quantity
    end

    def to_hash
      {
        cart_id: @cart.id,
        source_id: @source.id,
        source_type: @source.class.name,
        quantity: @quantity,
        sale_price: @source.price,
        list_price: @source.price
      }
    end

    def perform!
      validate!
      add!
    end

    def add!
      line_item = Shopping::LineItem.create!(to_hash)
    end

    protected

      def unpurchased_cart
        return if @cart.nil?
        errors.add(:base, 'Transaction already in progress') if @cart.purchased_at.present?
      end
  end
end
