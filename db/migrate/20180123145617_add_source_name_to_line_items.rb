class AddSourceNameToLineItems < ActiveRecord::Migration
  def change
    add_column :shopping_line_items, :source_name, :string
  end
end
