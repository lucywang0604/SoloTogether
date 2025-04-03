class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :current_city, class_name: "City", optional: true
  belongs_to :original_city, class_name: "City", optional: true

  has_many :experiences, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :booked_experiences, through: :bookings, source: :experience

  has_many :trips, dependent: :destroy
  has_many :visited_cities, through: :trips, source: :city

  # Friend-related associations
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id', dependent: :destroy
  has_many :inverse_friends, through: :inverse_friendships, source: :profile

  # Friend request associations
  has_many :sent_friend_requests, class_name: 'FriendRequest', foreign_key: 'sender_id', dependent: :destroy
  has_many :received_friend_requests, class_name: 'FriendRequest', foreign_key: 'receiver_id', dependent: :destroy

  enum mode: {
    visitor: "visitor",
    local: "local"
  }

  has_one_attached :avatar

  reverse_geocoded_by "cities.latitude", "cities.longitude"

  def all_friends
    friends + inverse_friends
  end

  def pending_sent_requests
    sent_friend_requests.pending
  end

  def pending_received_requests
    received_friend_requests.pending
  end
end
