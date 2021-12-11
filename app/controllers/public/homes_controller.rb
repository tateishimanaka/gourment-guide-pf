class Public::HomesController < ApplicationController
  def top
    @shops_all = Shop.where(is_deleted: false).order("id DESC")
    @shops = @shops_all.limit(5)
  end

  def about
    @shops_all = Shop.where(is_deleted: false).order("id DESC")
    @shops = @shops_all.page(params[:page]).per(20)
  end
end
