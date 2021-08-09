class RoomsController < ApplicationController
  def index
    render layout: 'home'
    @rooms = Room.all.order(:id)
    @room = Room.new

    @messages = Message.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      @room.room_users.create(user_id: current_user.id)
      redirect_to room_path(@room.id)
    else
      render :new
    end
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages.includes(:user)
    @message = Message.new
    render layout: 'room'
    
  end

  private

  def room_params
    params.require(:room).permit(:name, user_ids: []).merge(user_id: current_user.id)
  end

end
