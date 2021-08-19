class QuestionsController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    @question = @room.questions.new(question_params)
  end

  private

  def question_params
    params.require(:question).permit(:title, :q_content, :q_answer)
  end
end
