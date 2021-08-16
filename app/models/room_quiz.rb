class RoomQuiz < ApplicationRecord
  belongs_to :room
  belongs_to :quiz
end
