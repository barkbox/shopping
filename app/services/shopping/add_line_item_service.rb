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
        source_type: @source.type,
        quantity: @quantity
      }
    end

    def perform!
      validate!
      add!
    end

    def add!
      line_item = Shopping::LineItem.new()
      line_item.cart_id = @cart.id
      line_item.source_id = @source.id
      line_item.source_type = @source.type
      line_item.sale_price = line_item.list_price = @source.price
      line_item.quantity = @quantity
      line_item.save!
    end

    protected

      def unpurchased_cart
        return if @cart.nil?
        errors.add(:base, 'Transaction already in progress') if @cart.purchased_at.present?
      end
  end
end
