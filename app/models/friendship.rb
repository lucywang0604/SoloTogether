class Friendship < ApplicationRecord
    belongs_to :profile
    belongs_to :friend, class_name: 'Profile'

    validates :profile_id, uniqueness: { scope: :friend_id }
    validate :not_self

    private

    def not_self
        errors.add(:friend, "can't be the same as profile") if profile_id == friend_id
    end
end
