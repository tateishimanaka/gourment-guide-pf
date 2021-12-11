class Public::SeatsController < ApplicationController

  def index
    @shop = Shop.find(params[:shop_id])
    @seats = @shop.seats.where(is_active: true).order("id DESC")
  end

end
