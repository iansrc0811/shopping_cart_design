class VendorShopRelation < ApplicationRecord
  belongs_to :shop
  belongs_to :vendor
end
