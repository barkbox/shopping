class AddDefaultToShoppingCartsMeta < ActiveRecord::Migration
  def change
    change_column :shopping_carts, :meta, :jsonb, default: {}
  end
end
