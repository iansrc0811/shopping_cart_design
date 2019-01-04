class VendorShopRelation < ApplicationRecord
  belongs_to :shop
  belongs_to :vendor
  has_many :products
  has_many :discounts, as: :discountable
end
