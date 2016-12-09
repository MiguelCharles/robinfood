class Shop < ApplicationRecord
  belongs_to :user
  has_many :promotions
  geocoded_by :address
  validates :zip_code, presence: true
  validates :city, presence: true

  validates :country, presence: true

  after_validation :geocode


  # def full_address
  #   "#{address}, #{street_number} #{zip_code} #{city} #{country}"
  # end
end
