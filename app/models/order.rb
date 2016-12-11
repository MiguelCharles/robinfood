class Order < ApplicationRecord
  belongs_to :promotion
  belongs_to :user, optional: true

  validates :quantity_ordered, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
