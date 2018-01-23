class AddPricesToItems < ActiveRecord::Migration
  def change
    add_column :items, :list_price, :decimal
    add_column :items, :sale_price, :decimal
  end
end
