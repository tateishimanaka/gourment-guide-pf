class Restaurant::MenusController < ApplicationController

  before_action :authenticate_shop!

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    @menu.shop_id = current_shop.id
    if  @menu.save
      redirect_to restaurant_menu_path(@menu)
    else
      render :new
    end
  end

  def index
    @menus = current_shop.menus.page(params[:page]).per(20).order("id DESC")
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def edit
    @menu = Menu.find(params[:id])
    if @menu.shop != current_shop
      redirect_to new_shop_session_path
    end
  end

  def update
    @menu = Menu.find(params[:id])
    if @menu.update(menu_params)
      redirect_to restaurant_menu_path(@menu)
    else
      render :edit
    end
  end

  private

  def menu_params
    params.require(:menu).permit(:shop_id, :name, :image, :price, :is_active)
  end
end
