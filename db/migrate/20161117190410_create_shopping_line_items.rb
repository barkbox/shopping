class CreateShoppingLineItems < ActiveRecord::Migration
  def change
    create_table :shopping_line_items do |t|
      t.integer  :cart_id
      t.integer  :source_id
      t.string   :source_type
      t.integer  :quantity
      t.decimal  :list_price
      t.decimal  :sale_price

      t.timestamps null: false
    end
  end
end
