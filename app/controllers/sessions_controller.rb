class SessionsController < ApplicationController
  
  def newsession
  end

  def create
  	user_ent = UserEnt.find_by(email: params[:session][:email].downcase)
   if user_ent && user_ent.authenticate(params[:session][:password])
    log_in user_ent
      redirect_to user
  	else
    flash.now[:danger] = 'Invalid email/password combination'
  		render 'newsession'
  end
end

  def destroy
  end

end
