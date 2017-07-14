module Shopping
  class UpdateLineItemService < Shopping::BaseService

    attr_accessor :cart, 
                  :source,
                  :quantity,
                  :meta

    validates :cart, :source, presence: true
    validate :unpurchased_cart

    def initialize cart, source, quantity=nil, meta={}
      @cart = cart
      @source = source
      @meta = meta
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
      update!
    end

    def update!
      line_item = @cart.line_items.where(source_id: @source.id, source_type: @source.type, sale_price: @source.price).first
      line_item.quantity = @quantity
      line_item.meta = line_item.meta.merge(meta)
      line_item.save!
    end

    protected

      def unpurchased_cart
        return if @cart.nil?
        errors.add(:base, 'Transaction already in progress') if @cart.purchased_at.present?
      end
  end
end
