class Room < ApplicationRecord
  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :room_quizzes
  has_many :qyizzes, through: :room_quizzes
  has_many :questions, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
