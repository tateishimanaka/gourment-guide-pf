class SearchesController < ApplicationController
  def search
    if params[:shop_name].present?
      @shops = Shop.where('shop_name LIKE ?' , "%#{params[:shop_name]}%")
    elsif params[:genre].present?
      @shops = Shop.where('genre LIKE ?', "%#{params[:genre]}%")
    elsif params[:address].present?
      @shops = Shop.where('address LIKE ?', "%#{params[:address]}%")
    else
      @shops = Shop.none
    end
  end
end
