class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.integer :sale
      t.integer :number
      t.string :detail
      t.string :image
      t.references :category, index: true, foreign_key: true

      t.timestamps
    end
  end
end
