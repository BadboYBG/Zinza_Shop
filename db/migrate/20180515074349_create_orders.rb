class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.decimal :total
      t.integer :status, default: 0
      t.string :date_order
      t.string :date_delivery
      t.string :address

      t.timestamps
    end
  end
end
