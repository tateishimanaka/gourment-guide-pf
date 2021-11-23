class Restaurant::ShopsController < ApplicationController

  def show
    @shop = current_shop
  end

end
