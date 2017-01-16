class UpdateLineItemService < BaseService

  attr_accessor :cart, 
                :source,
                :quantity

  validates :cart, :source, :quantity, presence: true
  validate :unpurchased_cart

  def initialize cart, source, quantity
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
    update!
  end

  def update!
    line_item = @cart.line_items.find_by(source: source, sale_price: source.price)
    raise 'Unable to update line item' if line_item.nil?
    if @quantity > 0
      line_item.quantity = @quantity
      line_item.save!
    else
      line_item.destroy!
    end
  end

  protected

    def unpurchased_cart
      return if @cart.nil?
      errors.add(:base, 'Transaction already in progress') if @cart.purchased_at.present?
    end
end
