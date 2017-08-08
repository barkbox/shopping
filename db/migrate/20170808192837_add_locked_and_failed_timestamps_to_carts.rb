class AddLockedAndFailedTimestampsToCarts < ActiveRecord::Migration
  def change
    add_column :shopping_carts, :locked_at, :timestamp
    add_column :shopping_carts, :failed_at, :timestamp
  end
end
