class Admin::ShopsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @shops = Shop.page(params[:page]).per(10).order("id DESC")
  end
end
