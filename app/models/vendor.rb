class Vendor < ApplicationRecord
  has_many :vendor_shop_relations
  has_many :shops, through: :vendor_shop_relations
  has_many :products
end
