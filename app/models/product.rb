class Product < ApplicationRecord
  belongs_to :vendor_shop_relation
  has_many :line_items
  delegate :shop, :vendor, to: :vendor_shop_relation
end
