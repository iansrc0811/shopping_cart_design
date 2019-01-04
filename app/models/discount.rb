class Discount < ApplicationRecord
  belongs_to :shop
  belongs_to :discountable, :polymorphic => true
  has_many :discount_gifts
  # gift 其實是 product, 在 has_many through 時要用 source 指定原 class 才找得到
  has_many :gifts, through: :discount_gifts, source: :product

  after_create do
    set_description
  end
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

  scope :is_active, -> { where(active: true) }

  def is_free_shipping?
    set_discount_free_shipping?
  end

  def set_description
    if set_discount_free_shipping?
      self.description = "滿 " + self.threshold.to_s + " " + I18n.t("enums.condition_unit_type.#{condition_unit_type}") + " " + I18n.t("enums.discount_type.free_shipping")
    elsif set_discount_gift?
      self.description = "滿 " + self.threshold.to_s + " " + I18n.t("enums.condition_unit_type.#{condition_unit_type}") + " 送 " + gifts.pluck(:name).join(', ')
    else
      self.description = "滿 " + self.threshold.to_s + " " + I18n.t("enums.condition_unit_type.#{condition_unit_type}") + " 折 " + discount_amount + " " + I18n.t("enums.discount_type.price")
    end
    self.name = self.description
    save!
  end
end
