class SimplePagesController < ApplicationController
  
  def index
    @products = Product.limit(9)
    @homepage = true
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @message).deliver_now
  end
end

