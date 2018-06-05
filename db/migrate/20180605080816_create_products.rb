class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :product_id, index: true
      t.integer :price
      t.string :category
      t.integer :stock_number
      t.text :description
      t.timestamps
    end
  end
end
