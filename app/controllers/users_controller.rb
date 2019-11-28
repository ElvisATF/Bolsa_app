class UsersController < ApplicationController
   before_action :logged_in_candidate,      only: [:index, :edit, :update, :destroy, :following]
   before_action :correct,                  only: [:edit, :update]
   before_action :admin_user,                    only: :destroy
 #before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.paginate(page: params[:page])
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
    @user.image.attach(params[:user][:image])
    if @user.save
      log_in_user @user
      flash[:success] = "Bem vindo á Bolsa de emprego"
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
  if @user.update(user_params)
    flash[:success] = "Perfil atualizado"
    redirect_to @user
   else
    render 'edit'
   end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Ustelisador apagado"
    redirect_to users_url
    end

  private
       
    def following
  @title = "Following"
  @user = User.find(params[:id])
  @users = @user.following.paginate(page: params[:page])
  render 'show_follow'
  end

  

    def logged_in_candidate
      unless logged_in?
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
      params.require(:user).permit(:email, :password, :password_confirmation, :name, :address, :postal_cod, :locality, :contact, :identity_card, :professional_area, :presentation, :level_of_qualifications, :literary_abilities, :professional_situation, :professional_expirience,:image)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end


  

end
