class Discount < ApplicationRecord
  belongs_to :shop
  belongs_to :discountable, :polymorphic => true
  has_many :gifts, class_name: 'Product'

  enum condition_unit_type: {
    quantity:    1,
    total_price: 2,
  }, _prefix: :set_unit

  enum discount_type: {
    price:         1,
    percentage:    2,
    free_shipping: 3,
    gift:          4,
  }, _prefix: :set_discount

  def is_free_shipping?
    set_discount_free_shipping
  end
end
