class Restaurant::ImagesController < ApplicationController

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.shop_id = current_shop.id
    @image.save
    redirect_to restaurant_images_path
  end

  def index
    @images = current_shop.images.page(params[:page]).per(20).order("id DESC")
  end

  def show
    @image = Image.find(params[:id])
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    @image.shop_id = current_shop.id
    @image.update(image_params)
    redirect_to restaurant_image_path(@image.id)
  end

  def destroy
  end

  private

  def image_params
    params.require(:image).permit(:image, :shop_id, :introduction)
  end
end
