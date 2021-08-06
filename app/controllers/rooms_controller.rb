class RoomsController < ApplicationController
  def index
    @user = User.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      @room.room_users.create(user_id: current_user.id)
      redirect_to rooms_path(@room)
    else
      render :new
    end
  end


  private

  def room_params
    params.require(:room).permit(:name, :user_ids).merge(user_id: current_user.id)
  end

end

