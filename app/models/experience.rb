class Experience < ApplicationRecord
  belongs_to :profile
  belongs_to :city

  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  has_one_attached :photo

  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :duration, numericality: { only_integer: true, greater_than: 0 }
  validates :photo, presence: true

  reverse_geocoded_by "cities.latitude", "cities.longitude"
end
