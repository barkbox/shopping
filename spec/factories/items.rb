class Item
  attr_accessor :id, :type, :price

  def initialize(id, price)
    @id = id
    @price = price
    @type = self.class.name
  end

  def save!
  end
  alias_method :save, :save!

  class << self
    def find
      return Item.new
    end
  end
end

FactoryGirl.define do
  factory :item do
    sequence(:id) { |n| n  }
    price 5.0

    initialize_with { new(id, price) }
  end
end
