class Restaurant::ShopsController < ApplicationController

  def show
    @shop = current_shop
  end

  def edit
    @shop = current_shop
  end

  def update
    @shop = current_shop
    @shop.update(shop_params)
    redirect_to restaurant_shops_path
  end

  def unsubscribe
  end

  def withdraw
  end

  private

  def shop_params
    params.require(:shop).permit(:email, :shop_name, :shop_name_kana, :postal_code, :address, :telephone_number, :opening_hours, :holiday, :introduction, :image, :genre, :reserve, :parking_space, :payment_method, :smoking, :private_room, :ticket, :children, :wait_time, :access, :is_deleted)
  end

end