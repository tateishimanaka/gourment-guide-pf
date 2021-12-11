class Admin::ShopsController < ApplicationController
  def index
    @shops = Shop.page(params[:page]).per(10).order("id DESC")
  end
end
