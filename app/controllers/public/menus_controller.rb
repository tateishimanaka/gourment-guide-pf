class Public::MenusController < ApplicationController

  def index
    @shop = Shop.find(params[:shop_id])
    @menus_all = @shop.menus.where(is_active: true).order("id DESC")
    @menus = @menus_all.page(params[:page]).per(20)
  end

  def show
    @shop = Shop.find(params[:shop_id])
    @menu = Menu.find(params[:id])
  end

end
