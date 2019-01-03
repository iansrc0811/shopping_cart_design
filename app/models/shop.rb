class Shop < ApplicationRecord
  has_many :vendor_shop_relations
  has_many :vendors, through: :vendor_shop_relations
  has_many :discounts, dependent: :destroy
  has_many :order_discounts, class_name: 'Discount', as: :discountable

  def products
    Product.where(vendor_id: vendors.pluck(:id))
  end

  def order_discount(condition=nil)
    return order_discounts.last if condition.empty?
  end
end
