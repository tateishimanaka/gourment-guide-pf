class SearchesController < ApplicationController
  def search
    if params[:shop_name].present?
      @shops = Shop.where('shop_name LIKE ?', "%#{params[:shop_name]}%")
    elsif
      @shops = Shop.where('genre LIKE ?', "%#{params[:genre]}")
    else
      @shops = Shop.none
    end
  end
end
