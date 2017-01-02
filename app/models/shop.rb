class Shop < ApplicationRecord
  belongs_to :user
  has_many :promotions
  geocoded_by :full_address
  validates :zip_code, presence: true
  validates :city, presence: true
  validates :country, presence: true
  after_validation :geocode

  after_create :send_confirmation_email
  mount_uploader :photo_url, PhotoUploader

  def full_address
    "#{address}, #{street_number} #{zip_code} #{city} #{country}"
  end

  private

  def send_confirmation_email
    ShopMailer.partnership_demand(self).deliver_now
  end
end
