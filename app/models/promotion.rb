class Promotion < ApplicationRecord
  belongs_to :shop
  has_many :orders
  validates :shop, presence: true
  mount_uploader :photo_url, PhotoUploader
  # geocoded_by :address
  # after_validation :geocode


   attr_accessor :until

  def initial_price_to_float
    (initial_price_per_unit.to_f).round(2)
  end

  def price_after_promotion_to_float
    (price_after_promotion_per_unit.to_f).round(2)
  end

  def change_status
    if self.promotion_status
      self.promotion_status = false
    else
      self.digits_code = (1000..9999).to_a.sample
      self.promotion_status = true
    end
    self.save
  end
end
