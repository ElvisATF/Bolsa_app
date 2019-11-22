class SessionsController < ApplicationController
  
  def newsession
  end

  def create
        user = User.find_by(email: params[:session][:email].downcase)
      	user_entity = UserEntity.find_by(email: params[:session][:email].downcase)
   if user_entity && user_entity.authenticate(params[:session][:password])
        log_in user_entity
        params[:session][:remember_me] == '1' ? remember(user_entity) : forget(user_entity)
        redirect_back_or user_entity
  	elsif
        user && user.authenticate(params[:session][:password])
        log_in_user user
        params[:session][:remember_me] == '1' ? remember(user) : forget_user(user)
        redirect_back_or user
   elsif
        flash.now[:danger] = 'Invalid email/password combination'
        render 'newsession'
    end
   end


  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  #def destroy_user
   # log_out_user if logged_in?
    #redirect_to root_url
  #end

end

