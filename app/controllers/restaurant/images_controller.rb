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
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def image_params
    params.require(:image).permit(:image, :shop_id, :introduction)
  end
end
