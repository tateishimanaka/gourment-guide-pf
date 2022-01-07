class Public::SeatsController < ApplicationController

  def index
    @shop = Shop.find(params[:shop_id])
    @seats = @shop.seats.where(is_active: true).order("id DESC")
  end

  def show
    @shop = Shop.find(params[:shop_id])
    @seat = Seat.find(params[:id])
  end
end
