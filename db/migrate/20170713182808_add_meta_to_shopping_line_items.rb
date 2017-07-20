class AddMetaToShoppingLineItems < ActiveRecord::Migration
  def change
    add_column :shopping_line_items, :meta, :jsonb
  end
end
