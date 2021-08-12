class CreateQuizzes < ActiveRecord::Migration[6.0]
  def change
    create_table :quizzes do |t|
      t.string :title,           null: false
      t.text   :quizzes_content, null: false
      t.text   :answer,          null: false
      t.timestamps
    end
  end
end
