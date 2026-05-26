module Shopping
  class UpdateLineItemService < Shopping::BaseService

    attr_accessor :cart, 
                  :source,
                  :quantity,
                  :options

    validates :cart, :source, presence: true
    validate :unpurchased_cart

    def initialize cart, source, quantity=nil, options={}
      @cart = cart
      @source = source
      @options = options
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
      line_item = @cart.line_items.find_by!(source_id: @source.id, source_type: @source.class.name, sale_price: @source.price)
      line_item.quantity = @quantity
      original_options = line_item.options || {}
      line_item.options = original_options.merge(options)
      line_item.save!
    end

    protected

      def unpurchased_cart
        return if @cart.nil?
        errors.add(:base, "can't update purchased line item") if @cart.purchased_at.present?
      end
  end
end
