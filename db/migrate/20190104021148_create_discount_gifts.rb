class CreateDiscountGifts < ActiveRecord::Migration[5.2]
  def change
    create_table :discount_gifts do |t|
      t.references :product, foreign_key: true
      t.references :discount, foreign_key: true

      t.timestamps
    end
  end
end
