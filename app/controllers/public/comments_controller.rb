class Public::CommentsController < ApplicationController

  def create
    shop = Shop.find(params[:shop_id])
    comment = Comment.new(comment_params)
    comment.customer = current_customer
    comment.shop_id = shop.id
    comment.save
    redirect_to shop_path(shop.id)
  end

  def destroy
    Comment.find_by(id: params[:id]).destroy
    redirect_to shop_path(params[:shop_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
