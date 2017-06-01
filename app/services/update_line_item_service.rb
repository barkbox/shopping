class UpdateLineItemService < BaseService

  attr_accessor :cart, 
                :source,
                :quantity,
                :line_item

  validates :line_item, :cart, :source, :quantity, presence: true
  validate :unpurchased_cart

  def initialize line_item, cart, source, quantity
    @line_item = line_item
    @cart = cart
    @source = source
    @quantity = quantity
  end

  def to_hash
    {
      cart_id: cart.id,
      source_id: source.id,
      source_type: source.type,
      quantity: quantity
    }
  end

  def perform!
    validate!
    update!
  end

  def update!
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
