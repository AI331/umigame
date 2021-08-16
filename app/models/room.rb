class Room < ApplicationRecord
  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users
  has_many :messages
  has_many :quizzes, through: :room_quizzes
  has_many :room_quizzes

  validates :name, presence: true, uniqueness: true
end
