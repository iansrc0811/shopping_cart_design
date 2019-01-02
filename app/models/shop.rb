class Shop < ApplicationRecord
  has_many :vendor_shop_relations
  has_many :vendors, through: :vendor_shop_relations
end
