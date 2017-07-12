class AddOriginToShoppingCarts < ActiveRecord::Migration
  def change
    add_column :shopping_carts, :origin, :string

    add_index :shopping_carts, :origin
  end
end
