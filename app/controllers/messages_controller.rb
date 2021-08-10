class MessagesController < ApplicationController
  def index
    @messages.all
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    @message.save
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    @message.save
  end

  private

  def message_params
    params.require(:message).permit(:messages_content).merge(user_id: current_user.id)
  end
end
