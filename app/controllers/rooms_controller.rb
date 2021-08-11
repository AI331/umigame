class RoomsController < ApplicationController
  layout 'home'
  before_action :set_q, only: %i[index search]
  def index
    if user_signed_in?
      @rooms = current_user.rooms
      @room = Room.new
    end
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

    @room.users << current_user unless @room.users.include?(current_user)

    render layout: 'room'
  end

  def search
    @rooms = @search.result
  end

  private

  def room_params
    params.require(:room).permit(:name, user_ids: []).merge(user_id: current_user.id)
  end

  def set_q
    @search = Room.ransack(params[:q])
  end
end
