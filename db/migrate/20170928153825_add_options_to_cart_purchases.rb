class AddOptionsToCartPurchases < ActiveRecord::Migration
  def change
    add_column :shopping_cart_purchases, :options, :jsonb, null: false, default: {}
  end
end
