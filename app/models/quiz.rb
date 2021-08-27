class Quiz < ApplicationRecord
  has_many :room_quizzes
  has_many :rooms, through: :room_quizzes
end
