class QuestionsController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    quiz = Quiz.find(question_params[:quiz_id])
    @user = User.find_by(id: current_user.id)
    @question = @room.questions.new(title: quiz.title, q_content: quiz.quizzes_content, q_answer: quiz.answer, quiz_id: quiz.id)
    ActionCable.server.broadcast 'question_channel', content: @question if @question.save
  end

  def destroy
    @question = Question.find(params[:room_id])
    ActionCable.server.broadcast 'delete_channel', content: @question if @question.destroy
  end

  private

  def question_params
    params.require(:question).permit(:quiz_id)
  end
end
