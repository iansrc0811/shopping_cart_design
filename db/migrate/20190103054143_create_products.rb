class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :vendor, foreign_key: true
      t.string :name, null: false
      t.float :price, null: false
      t.integer :stock
      t.string :barcode
      t.string :sku

      t.timestamps
    end
  end
end
