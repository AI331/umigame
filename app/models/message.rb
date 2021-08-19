class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_one :comment

  validates :messages_content, presence: true
end
