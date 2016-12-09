class Promotion < ApplicationRecord
  belongs_to :shop
  has_many :orders
  validates :shop, presence: true
end
