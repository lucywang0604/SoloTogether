class City < ApplicationRecord
  has_many :experiences
  has_one_attached :photo

  geocoded_by :name
  after_validation :geocode, if: :will_save_change_to_name?
end
