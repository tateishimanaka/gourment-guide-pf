class Restaurant::MenusController < ApplicationController

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    @menu.shop_id = current_shop.id
    @menu.save
    redirect_to restaurant_menu_path(@menu)
  end

  def index
    @menus = current_shop.menus.page(params[:page]).per(20)
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def update
    @menu = Menu.find(params[:id])
    @menu.update(menu_params)
    redirect_to restaurant_menu_path(@menu)
  end

  private

  def menu_params
    params.require(:menu).permit(:shop_id, :name, :image, :price, :is_active)
  end
end
