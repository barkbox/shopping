class CreateShoppingCarts < ActiveRecord::Migration
  def change
    create_table :shopping_carts do |t|
      t.integer  :user_id
      t.integer  :order_id
      t.datetime :purchased_at

      t.timestamps null: false
    end
  end
end
