class ChangeTimeStampsToDateTimeOnCartPurchases < ActiveRecord::Migration
  def change
    change_column :shopping_cart_purchases, :succeeded_at, "timestamp USING (now()::date + succeeded_at)"
    change_column :shopping_cart_purchases, :failed_at, "timestamp USING (now()::date + failed_at)"
  end
end
