class Product < ApplicationRecord
  belongs_to :vendor_shop_relation
  has_many :line_items
  has_many :discount_gifts
  has_many :discounts, through: :discount_gifts
  delegate :shop, :vendor, to: :vendor_shop_relation
  has_many :discounts, as: :discountable
end
