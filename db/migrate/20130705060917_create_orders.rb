class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :user_name
      t.string :user_email
      t.string :token
      t.string :item_ids
      t.timestamps
    end
  end
end
