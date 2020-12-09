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
      if GroupUser.exists?(user_id: current_user)
        gu = GroupUser.where(user_id: current_user)
        $groupId = gu[0].group_id
      end
      redirect_to "/"
    else
      redirect_to "/login"
    end
  end
end
