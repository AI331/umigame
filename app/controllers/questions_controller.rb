class QuestionsController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    quiz = Quiz.find(question_params[:quiz_id])
    @question = @room.questions.create(title: quiz.title, q_content: quiz.quizzes_content, q_answer: quiz.answer, quiz_id: quiz.id)
    redirect_to room_url(@room)
  end

  private

  def question_params
    params.require(:question).permit(:quiz_id)
  end
end
