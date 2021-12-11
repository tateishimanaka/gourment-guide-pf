class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.page(params[:page]).per(10).order("id DESC")
  end
end
