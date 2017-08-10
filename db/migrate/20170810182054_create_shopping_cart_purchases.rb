class CreateShoppingCartPurchases < ActiveRecord::Migration
  def change
    create_table :shopping_cart_purchases do |t|
      t.integer :cart_id
      t.time :succeeded_at
      t.time :failed_at

      t.timestamps null: false
    end
  end
end
