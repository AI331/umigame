class CreateRoomQuizzes < ActiveRecord::Migration[6.0]
  def change
    create_table :room_quizzes do |t|
      t.references :room, null: false, foreign_key: true
      t.references :quiz, null: false, foreign_key: true
      t.timestamps
    end
  end
end
