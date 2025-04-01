class Friendship < ApplicationRecord
    belongs_to :profile_one, class_name: 'Profile'
    belongs_to :profile_two, class_name: 'Profile'
end
