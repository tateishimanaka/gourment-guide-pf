class InquiryController < ApplicationController
  def index
    @inquiry = Inquiry.new
    # render :action => 'index'
  end

  def confirm
    @inquiry = Inquiry.new(inquiry_params)
    unless @inquiry.valid?
      render :index
    end
  end

  def thanks
    @inquiry = Inquiry.new(inquiry_params)
    InquiryMailer.received_email(@inquiry).deliver
    # render :action => 'thanks'
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :message)
  end
end
