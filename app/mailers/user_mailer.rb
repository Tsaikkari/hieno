class UserMailer < ApplicationMailer
  default from: "from@example.com"

  def contact_form(email, name, message)
  @message = message
    mail(from: email,
         to: 'trospe@gmx.de',
         subject: "A new contact form message from #{name}")
  end

  def order_placed(user, email)
    mail(to: user.email,
         subject: "Order placed")
  end
end
