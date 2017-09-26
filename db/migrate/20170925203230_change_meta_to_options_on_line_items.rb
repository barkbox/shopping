class ChangeMetaToOptionsOnLineItems < ActiveRecord::Migration
  def change
    rename_column :shopping_line_items, :meta, :options
    change_column :shopping_line_items, :options, :jsonb, default: {}
  end
end
