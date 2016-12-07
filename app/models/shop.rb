class Shop < ApplicationRecord
  belongs_to :user
  has_many :promotions
end
