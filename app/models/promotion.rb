class Promotion < ApplicationRecord
  belongs_to :shop
  has_many :orders
end
