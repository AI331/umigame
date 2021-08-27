require "csv"

CSV.foreach('db/umigame.csv') do |row|
  Quiz.create!(title: row[0], quizzes_content: row[1], answer: row[2], created_at: row[3], updated_at: row[4])
end