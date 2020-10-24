class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]
  
  def index
    @rooms = current_user.rooms
  end

  def show
    @images = @room.images
  end

  def new
    @room = current_user.rooms.build
  end

  def create
    @room = current_user.rooms.build(room_params)
    
    if @room.save 
      redirect_to edit_room_path(@room) , notice: "Saved..."
    else
      render new_room_path , notice: "hmmmmmm...well well"
    end
  end

  def edit
    unless current_user.id == @room.user.id
      redirect_to root_path, notice: "You don't have permission."
    end
  end

  def update
    if @room.update(room_params)
      redirect_to @room, notice: "Updated..."
    else
      render :edit 
    end
  end
  
  def destroy
    unless current_user.id == @room.user.id
      redirect_to root_path, notice: "You don't have permission."
    end
    @room.destroy
    redirect_to rooms_path, notice: 'Room was successfully destroyed.' 
  end

  private 
    def set_room 
      @room = Room.find(params[:id])
    end

    def room_params 
      params.require(:room).permit(:home_type, :room_type, :accomodate, :bed_room, :bath_room, :listing_name, :summary, :address, :is_wifi, :is_kitchen, :is_air, :is_heating, :is_cable, :price, :active, :latitude, :longitude, images: [])
    end
end
