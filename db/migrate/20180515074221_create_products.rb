class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.integer :sale
      t.integer :number
      t.string :detail
      t.string :image
      t.integer :category_id

      t.timestamps
    end
  end
end
