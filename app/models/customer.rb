class Customer < ApplicationRecord
  # has_many :orders
  enum sex: {
    not_set: 1,
    male:    2,
    female:  3,
    other:   4,
  }

end
