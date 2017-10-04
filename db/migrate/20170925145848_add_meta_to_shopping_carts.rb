class AddMetaToShoppingCarts < ActiveRecord::Migration
  def change
    add_column :shopping_carts, :meta, :jsonb
  end
end
