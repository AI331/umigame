class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :room
  belongs_to :message

  validates :comment, presence: true
end
