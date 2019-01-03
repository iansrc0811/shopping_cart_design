class AddShopReferencesToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :vendor_shop_relation, foreign_key: true
    remove_reference :products, :vendor
  end
end
