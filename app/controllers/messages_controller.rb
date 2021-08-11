class MessagesController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    @message.save
    redirect_to room_url(@room)
  end

  private

  def message_params
    params.require(:message).permit(:messages_content).merge(user_id: current_user.id)
  end
end
