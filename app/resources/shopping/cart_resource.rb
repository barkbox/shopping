module Shopping
  class CartResource < JSONAPI::Resource
    model_name 'Shopping::Cart'

    attributes :user_id, :purchased_at, :created_at, :updated_at, :origin
    has_many :line_items
    has_many :cart_purchases

    filters :user_id, :origin

    filter :state, apply: ->(records, value, _options){
      case value[0]
      when 'purchased'
        records.purchased
      when 'failed'
        records.failed
      when 'open'
        records.open
      when 'canceled'
        records.canceled
      end
    }

    def self.updatable_fields(context)
      super - [:updated_at, :created_at, :purchased_at, :origin]
    end

    def self.creatable_fields(context)
      super - [:updated_at, :created_at, :purchased_at, :order_id, :invoice_id]
    end

  end
end
