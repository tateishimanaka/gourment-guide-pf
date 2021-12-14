# frozen_string_literal: true

class Restaurant::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  def after_sign_in_path_for(resource)
    restaurant_shops_path
  end

  def after_sign_out_path_for(resource)
    restaurant_about_path
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  def reject_user
    @shop = Shop.find_by(email: params[:shop][:email].downcase)
    if @shop
      if (@customer.valid_password?(params[:shop][:password]) && (@shop.active_for_authentication? == false))
        flash[:error] = "退会済みです。"
        redirect_to new_shop_session_path
      end
    else
      flash[:error] = "必須項目を入力してください。"
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
