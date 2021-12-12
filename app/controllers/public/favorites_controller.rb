class Public::FavoritesController < ApplicationController

  before_action :authenticate_customer!

  def create
    @shop = Shop.find(params[:shop_id])
    favorite = current_customer.favorites.new(shop_id: @shop.id)
    favorite.save
    # redirect_to shop_path(shop.id)
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    favorite = current_customer.favorites.find_by(shop_id: @shop.id)
    favorite.destroy
    # redirect_to shop_path(shop.id)
  end

end
