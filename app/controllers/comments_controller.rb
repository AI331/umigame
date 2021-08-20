class CommentsController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    @user = User.find_by(id: current_user.id)
    @comment = @room.comments.new(comment_params)
    ActionCable.server.broadcast 'comment_channel', content: @comment, user: @user if @comment.save
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id)
  end
end
