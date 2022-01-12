class Restaurant::SeatsController < ApplicationController

  before_action :authenticate_shop!

  def new
    @seat = Seat.new
  end

  def create
    @seat = Seat.new(seat_params)
    @seat.shop_id = current_shop.id
    if @seat.save
      redirect_to restaurant_seats_path
    else
      render :new
    end
  end

  def index
    @seats = current_shop.seats
  end
  
  def show
    @seat = Seat.find(params[:id])
  end

  def edit
    @seat = Seat.find(params[:id])
    if @seat.shop != current_shop
      redirect_to new_shop_session_path
    end
  end

  def update
    @seat = Seat.find(params[:id])
    if @seat.update(seat_params)
      redirect_to restaurant_seats_path
    else
      render :edit
    end
  end

  def seat_params
    params.require(:seat).permit(:seat_type, :image, :introduction, :people, :smoking, :reserve, :is_active, :shop_id)
  end
end
