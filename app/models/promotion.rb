class Promotion < ApplicationRecord
  belongs_to :shop
  has_many :orders
  validates :shop, presence: true
  # geocoded_by :address
  # after_validation :geocode
  def change_status
    self.promotion_status ? self.promotion_status = false : self.promotion_status = true
    self.save
  end
end
