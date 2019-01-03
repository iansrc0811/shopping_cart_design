class Order < ApplicationRecord
  belongs_to :shop
  belongs_to :customer
  has_many :line_items
  after_create do
    default_name
  end
  enum status: {
    cart:     1,  # 還是購物車
    ready:    2,  # 新成立訂單
    shipped:  3,  # 已出貨
    returned: 4,  # 已退貨
  }
  enum financial_status: {
    not_paid:        1,
    paid:            2,
    pending_refund:  3,
    refunded:        4,
  }

  def default_name
    self.name = 'order_number' + self.id.to_s
    save!
  end

  def has_discount?
    shop.order_discount.is_active.present?
  end


end
