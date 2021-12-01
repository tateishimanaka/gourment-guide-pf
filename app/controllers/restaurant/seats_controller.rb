class Restaurant::SeatsController < ApplicationController
  
  def new
    @seat = Seat.new
  end
  
  def create
    @seat = Seat.new(seat_params)
    @seat.shop_id = current_shop.id
    @seat.save
    redirect_to restaurant_seats_path
  end
  
  def index
    @seats = current_shop.seates
  end
  
  def edit 
    @seat = Seat.find(params[:id])
  end
  
  def update
    @seat = Seat.find(params[:id])
    @seat.update(seat_params)
    redirect_to restaurant_seats_path
  end
  
  def seat_params 
    params.require(:seat).permit(:)
  end
end
