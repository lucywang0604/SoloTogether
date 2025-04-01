class Booking < ApplicationRecord
  belongs_to :experience
  belongs_to :profile
  has_one :review, dependent: :destroy
end
