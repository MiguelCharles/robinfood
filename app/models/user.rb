class User < ApplicationRecord
  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :address, presence: true
end
