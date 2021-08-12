class Quiz < ApplicationRecord
  has_many :rooms, throuth: :room_quizzes
  has_many :room_quizzes
end
