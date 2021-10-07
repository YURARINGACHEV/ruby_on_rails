class FormMailer < ApplicationMailer

  def form_email(user, message)
    @message = message
    @name = user.email
    mail(to: 'yura.ryngachev@gmail.com', subject: "Message from #{@name}")
  end
end