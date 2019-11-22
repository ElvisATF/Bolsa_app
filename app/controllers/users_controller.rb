class UsersController < ApplicationController
   before_action :logged_in_candidate,      only: [:index, :edit, :update]
   before_action :correct,                  only: [:edit, :update]
 #before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
  if @user.update(user_params)
    flash[:success] = "Profile updated"
    redirect_to @user
   else
    render 'edit'
   end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
     
     def logged_in_candidate
      unless logged_in_user?
      store_location
      redirect_to newsession_url
     end
    end

    def correct
    @user = User.find(params[:id])
    redirect_to(root_url) unless  current?(@user)
    end

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name, :address, :postal_cod, :locality, :contact, :identity_card, :professional_area, :presentation, :level_of_qualifications, :literary_abilities, :professional_situation, :professional_expirience)
    end
end
