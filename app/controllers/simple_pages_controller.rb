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
    ActionMailer::Base.mail(from: @email,
    to: 'trospe@gmx.de',
    subject: "A new contact form message from #{@name}",
    body: @message).deliver_now
  end
end
