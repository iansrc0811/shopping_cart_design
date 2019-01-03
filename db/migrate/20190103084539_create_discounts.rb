class CreateDiscounts < ActiveRecord::Migration[5.2]
  def change
    create_table :discounts do |t|
      t.references :shop, foreign_key: true
      t.references :discountable, polymorphic: true, index: true
      t.integer :condition_unit_type, null: false # 條件的單位，例如滿幾「件」或幾「元」有折扣
      t.float :threshold, default: 0, null: false # 條件的數量 滿「多少」件或「多少」元
      t.integer :discount_type, null: false # 折扣的條件「種類」，可以是折價錢、%數、送商品，或免運
      t.float :discount_amount # 折幾元或幾% 的話記在這個欄位, 看 discount_type
      t.string :name, null: false
      t.boolean :active, default: false, null: false  # 設定是否啟用
      t.boolean :set_maximum_total_price, default: false, null: false  # 是否設定總優惠金額
      t.boolean :set_maximum_usage_count, default: false, null: false  # 是否設定總使用次數
      t.boolean :set_maximum_percustomer_total_price, default: false, null: false # 是否設定每個消費者總優惠金額
      t.boolean :set_maximum_percustomer_usage_count, default: false, null: false # 是否設定每個消費者總使用次數
      t.float :maximum_total_price   # 最大總優惠金額(如果有啟用的話才有值)
      t.integer :maximum_usage_count # 最大總使用次數(如果有啟用的話才有值)
      t.float :maximum_percustomer_total_price  # 每個消費者最大總優惠金額(如果有啟用的話才有值)
      t.integer :maximum_percustomer_usage_count # 每個消費者最大使用次數(如果有啟用的話才有值)
      t.datetime :begin_at # 設定起始時間，沒設定就是無限期
      t.datetime :end_at   # 設定結束時間，沒設定就是無限期
      t.timestamps
    end
  end
end
