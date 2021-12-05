class Public::ShopsController < ApplicationController

  def index
    @shops_all = Shop.where(is_deleted: false).order("id DESC")
    @shops = @shops_all.page(params[:page]).per(20)

  end

  def show
    @shop = Shop.find(params[:id])
    @comment = Comment.new
  end

  def menu
    @shop = Shop.find(params[:id])
    @menus = @shop.menus
  end

  def seat
    @shop = Shop.find(params[:id])
    @seats = @shop.seats
  end

end
