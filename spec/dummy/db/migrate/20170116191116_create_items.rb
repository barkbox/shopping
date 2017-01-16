class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.float   :price
      t.timestamps null: false
    end
  end
end
