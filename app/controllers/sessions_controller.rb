class SessionsController < ApplicationController

  def new
  end


  def destroy
    log_out if logged_in?
    redirect_to "/"
  end

  def create
    user = User.find_by(mail: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to "/"
    else
      redirect_to "/login"
    end
  end
end
