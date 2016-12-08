class Shop < ApplicationRecord
  belongs_to :user
  has_many :promotions
  geocoded_by :full_address
  validates :zip_code, presence: true
  validates :city, presence: true

  validates :country, presence: true

  after_validation :geocode

  def full_address
    "#{address}, #{street_number} #{zip_code} #{city} #{country}"
  end

   # def full_address_changed?
   #   address_changed? || zip_code_changed? || city_changed? || country_changed?
   # end
end
