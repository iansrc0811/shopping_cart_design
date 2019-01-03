class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :name
      t.integer :status, default: 1, null: false
      t.integer :financial_status, default: 1, null: false
      t.references :shop, foreign_key: true
      t.references :customer, foreign_key: true
      t.float :price
      t.timestamps
    end
  end
end
