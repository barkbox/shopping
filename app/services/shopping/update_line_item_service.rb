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
        source_type: @source.class.name,
        quantity: @quantity
      }
    end

    def perform!
      validate!
      update!
    end

    def update!
      line_item = @cart.line_items.find_by!(source_id: @source.id, source_type: @source.type, sale_price: @source.price)
      line_item.quantity = @quantity
      original_meta = line_item.meta || {}
      line_item.meta = original_meta.merge(meta)
      line_item.save!
    end

    protected

      def unpurchased_cart
        return if @cart.nil?
        errors.add(:base, 'Transaction already in progress') if @cart.purchased_at.present?
      end
  end
end
