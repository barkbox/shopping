class ChangeMetaToOptionsOnShoppingCarts < ActiveRecord::Migration
  def change
    rename_column :shopping_carts, :meta, :options
  end
end
