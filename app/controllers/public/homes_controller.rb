class Public::HomesController < ApplicationController
  def top
    @shops_all = Shop.where(is_seleted: false).order("id DESC")
    @shops = @shops_all.limit(5)
  end

  def about
  end
end
