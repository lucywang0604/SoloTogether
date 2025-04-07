class City < ApplicationRecord
  has_many :experiences, dependent: :destroy
  has_many :current_profiles, class_name: "Profile", foreign_key: :current_city_id, dependent: :nullify
  has_many :original_profiles, class_name: "Profile", foreign_key: :original_city_id, dependent: :nullify
  has_many :trips, dependent: :destroy

  has_one_attached :photo

  geocoded_by :name
  after_validation :geocode, if: :will_save_change_to_name?
end
