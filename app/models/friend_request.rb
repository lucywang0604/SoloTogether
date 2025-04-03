class FriendRequest < ApplicationRecord
  belongs_to :sender, class_name: 'Profile'
  belongs_to :receiver, class_name: 'Profile'

  validates :sender_id, uniqueness: { scope: :receiver_id }
  validate :not_self
  validate :not_friends
  validate :not_pending

  enum status: {
    pending: 'pending',
    accepted: 'accepted',
    declined: 'declined'
  }

  private

  def not_self
    errors.add(:receiver, "can't be the same as sender") if sender_id == receiver_id
  end

  def not_friends
    errors.add(:receiver, 'is already a friend') if Friendship.exists?(profile: sender, friend: receiver)
  end

  def not_pending
    errors.add(:receiver, 'already has a pending request') if FriendRequest.exists?(sender: receiver, receiver: sender, status: 'pending')
  end
end
