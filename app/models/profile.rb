class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :current_city, class_name: "City", optional: true
  belongs_to :original_city, class_name: "City", optional: true

  has_many :experiences, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :friends, through: :friendships

  has_many :trips, dependent: :destroy
  has_many :visited_cities, through: :trips, source: :city

  enum mode: {
    visitor: "visitor",
    local: "local"
  }

  has_one_attached :avatar

  reverse_geocoded_by "cities.latitude", "cities.longitude"
end
