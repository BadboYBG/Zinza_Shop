class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, index: true, foreign_key: true
      t.decimal :total
      t.integer :status, default: 1
      t.date :date_delivery
      t.string :address

      t.timestamps
    end
  end
end
