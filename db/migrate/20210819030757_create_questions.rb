class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.references :room,      null: false, foreign_key: true 
      t.references :quiz,      null: false, foreign_key: true
      t.string     :title
      t.text       :q_content
      t.text       :q_answer
      t.timestamps
    end
  end
end
