class AddCanceledAtToShoppingCartPurchases < ActiveRecord::Migration
  def change
    add_column :shopping_cart_purchases, :canceled_at, :timestamp
  end
end
