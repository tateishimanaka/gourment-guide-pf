class Public::CommentsController < ApplicationController

  before_action :authenticate_customer!

  def create
    shop = Shop.find(params[:shop_id])
    comment = Comment.new(comment_params)
    comment.customer = current_customer
    comment.shop_id = shop.id
    comment.save
    redirect_to shop_path(shop.id)
  end

  def destroy
    shop = Shop.find(params[:shop_id])
    comment = current_customer.comments.find_by(shop_id: shop.id)
    comment.destroy
    redirect_to shop_path(shop.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(rate: params[:comment][:rate].to_i)
  end

end
