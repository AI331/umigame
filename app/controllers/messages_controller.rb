class MessagesController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    @user = User.find_by(id: current_user.id)
    @message = @room.messages.new(message_params)
    ActionCable.server.broadcast 'message_channel', content: @message, user: @user if @message.save
  end

  private

  def message_params
    params.require(:message).permit(:messages_content).merge(user_id: current_user.id)
  end
end
