class Promotion < ApplicationRecord
  belongs_to :shop
  has_many :orders
  validates :shop, presence: true
  # geocoded_by :address
  # after_validation :geocode
end
