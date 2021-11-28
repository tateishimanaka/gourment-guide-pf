class Public::ShopsController < ApplicationController

  def index
    @shops = Shop.all

  end

  def show
    @shop = Shop.find(params[:id])
    @comment = Comment.new
  end

end
