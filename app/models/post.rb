class Post < ApplicationRecord
  belongs_to :profile

  has_one_attached :photo
end
