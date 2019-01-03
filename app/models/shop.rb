class Shop < ApplicationRecord
  has_many :vendor_shop_relations
  has_many :vendors, through: :vendor_shop_relations
  has_many :discounts, dependent: :destroy
  has_many :order_discounts, class_name: 'Discount', as: :discountable

  def order_discount(condition=nil)
    return order_discounts.last if condition.empty?
  end

  def products
    Product.where(vendor_shop_relation_id: vendor_shop_relations.pluck(:id))
  end
end
