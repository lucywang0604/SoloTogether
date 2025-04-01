class Profile < ApplicationRecord
  belongs_to :user
  has_many :experiences, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :friends, through: :friendships
end
