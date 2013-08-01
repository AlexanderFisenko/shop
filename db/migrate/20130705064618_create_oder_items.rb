class CreateOderItems < ActiveRecord::Migration
  def change
    create_table :oder_items do |t|
      t.integer :item_id
      t.integer :order_id
      t.integer :quantity

      t.timestamps
    end
  end
end
