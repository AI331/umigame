class Room < ApplicationRecord
  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users
  has_many :messages, dependent: :destroy
  has_many :comments
  has_many :room_quizzes, dependent: :destroy
  has_many :quizzes, through: :room_quizzes
  has_many :questions

  validates :name, presence: true, uniqueness: true
end
