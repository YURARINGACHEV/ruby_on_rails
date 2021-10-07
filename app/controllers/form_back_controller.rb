class FormBackController < ApplicationController
  
  before_action :authenticate_user!

    def new
    end

   def create
    message = params[:message]
    if message.empty?
      flash.now[:alert] = t(".form")
      render :new
    else
      FormMailer.form_email(current_user, message).deliver_now
      redirect_to root_path
    end
  end

end
