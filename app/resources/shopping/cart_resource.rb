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
        records.where('purchased_at IS NOT NULL')
      when 'failed'
        records.where(purchased_at: nil).where.not(failed_at: nil)
      when 'open'
        records.where(purchased_at: nil, failed_at: nil)
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