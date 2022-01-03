class Restaurant::ImagesController < ApplicationController

  before_action :authenticate_shop!

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.shop_id = current_shop.id
    if @image.save
      redirect_to restaurant_images_path
    else
      render :new
    end
  end

  def index
    @images = current_shop.images.page(params[:page]).per(20).order("id DESC")
  end

  def show
    @image = Image.find(params[:id])
  end

  def edit
    @image = Image.find(params[:id])
    if @image.shop != current_shop
      redirect_to new_shop_session_path
    end
  end

  def update
    @image = Image.find(params[:id])
    @image.shop_id = current_shop.id
    if @image.update(image_params)
      redirect_to restaurant_image_path(@image.id)
    else
      render :edit
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to restaurant_images_path
  end

  private

  def image_params
    params.require(:image).permit(:image, :shop_id, :introduction)
  end
end
