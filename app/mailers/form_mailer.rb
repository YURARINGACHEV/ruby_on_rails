class FormMailer < ApplicationMailer

  def form_email(user)
    @name = user.name
    mail (to: 'yura.ryngachev@gmail.com', subject: "Message from #{@name}")
  end
end