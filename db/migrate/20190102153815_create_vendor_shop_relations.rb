class CreateVendorShopRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :vendor_shop_relations do |t|
      t.references :shop, foreign_key: true
      t.references :vendor, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
