class QuestionsController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    quiz = Quiz.find(question_params[:quiz_id])
    @question = @room.questions.new(title: quiz.title, q_content: quiz.quizzes_content, q_answer: quiz.answer, quiz_id: quiz.id)
    if @question.save
      ActionCable.server.broadcast 'question_channel', content: @question
    end
  end

  private

  def question_params
    params.require(:question).permit(:quiz_id)
  end
end
