class AddDescriptionToDiscount < ActiveRecord::Migration[5.2]
  def change
    add_column :discounts, :description, :string
  end
end
