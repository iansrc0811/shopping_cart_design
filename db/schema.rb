# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_01_04_021148) do

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.integer "sex"
    t.integer "age"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "discount_gifts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "discount_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discount_id"], name: "index_discount_gifts_on_discount_id"
    t.index ["product_id"], name: "index_discount_gifts_on_product_id"
  end

  create_table "discounts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "shop_id"
    t.string "discountable_type"
    t.bigint "discountable_id"
    t.integer "condition_unit_type", null: false
    t.float "threshold", default: 0.0, null: false
    t.integer "discount_type", null: false
    t.float "discount_amount"
    t.string "name", null: false
    t.boolean "active", default: false, null: false
    t.boolean "set_maximum_total_price", default: false, null: false
    t.boolean "set_maximum_usage_count", default: false, null: false
    t.boolean "set_maximum_percustomer_total_price", default: false, null: false
    t.boolean "set_maximum_percustomer_usage_count", default: false, null: false
    t.float "maximum_total_price"
    t.integer "maximum_usage_count"
    t.float "maximum_percustomer_total_price"
    t.integer "maximum_percustomer_usage_count"
    t.datetime "begin_at"
    t.datetime "end_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.index ["discountable_type", "discountable_id"], name: "index_discounts_on_discountable_type_and_discountable_id"
    t.index ["shop_id"], name: "index_discounts_on_shop_id"
  end

  create_table "line_items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "order_id"
    t.float "total_price"
    t.integer "pcs"
    t.string "sku"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_line_items_on_order_id"
    t.index ["product_id"], name: "index_line_items_on_product_id"
  end

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "status", default: 1, null: false
    t.integer "financial_status", default: 1, null: false
    t.bigint "shop_id"
    t.bigint "customer_id"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["shop_id"], name: "index_orders_on_shop_id"
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.float "price", null: false
    t.integer "stock"
    t.string "barcode"
    t.string "sku"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "vendor_shop_relation_id"
    t.index ["vendor_shop_relation_id"], name: "index_products_on_vendor_shop_relation_id"
  end

  create_table "shops", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vendor_shop_relations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "shop_id"
    t.bigint "vendor_id"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_vendor_shop_relations_on_shop_id"
    t.index ["vendor_id"], name: "index_vendor_shop_relations_on_vendor_id"
  end

  create_table "vendors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "discount_gifts", "discounts"
  add_foreign_key "discount_gifts", "products"
  add_foreign_key "discounts", "shops"
  add_foreign_key "line_items", "orders"
  add_foreign_key "line_items", "products"
  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "shops"
  add_foreign_key "products", "vendor_shop_relations"
  add_foreign_key "vendor_shop_relations", "shops"
  add_foreign_key "vendor_shop_relations", "vendors"
end
