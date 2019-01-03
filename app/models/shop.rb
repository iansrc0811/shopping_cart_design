class Shop < ApplicationRecord
  has_many :vendor_shop_relations
  has_many :vendors, through: :vendor_shop_relations

  def products
    Product.where(vendor_id: vendors.pluck(:id))
  end

end
