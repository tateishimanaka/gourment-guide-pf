class Public::ImagesController < ApplicationController

  def index
    @shop = Shop.find(params[:shop_id])
    @images = @shop.images.page(params[:page]).per(20).order("id DESC")
  end

  def show
    @shop = Shop.find(params[:shop_id])
    @image = Image.find(params[:id])
  end
end
