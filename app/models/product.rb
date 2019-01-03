class Product < ApplicationRecord
  belongs_to :vendor
  has_many :line_items
end
