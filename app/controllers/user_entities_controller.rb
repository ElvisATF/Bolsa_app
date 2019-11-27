class UserEntitiesController < ApplicationController
  before_action :logged_in_entity,           only: [:index, :edit, :update, :destroy]
  before_action :correct_user,               only: [:edit, :update]
  before_action :admin,                      only: :destroy
  #before_action :set_user, only: [:show, :edit, :update, :destroy]
   
  def index
    @user_entity = UserEntity.paginate(page: params[:page])
  end

	def show
		@user_entity = UserEntity.find(params[:id])
    @offers = @user_entity.offers.paginate(page: params[:page])
	end

  def new
  	@user_entity = UserEntity.new
  end

  def edit
   @user_entity = UserEntity.find(params[:id])
  end

  def create
    @user_entity = UserEntity.new(user_params)
    @user_entity.image.attach(params[:user_entity][:image])
    if @user_entity.save
      log_in @user_entity
  	  flash[:success] = "Bem vindo á Bolsa de Empregos!"
  	  redirect_to @user_entity
    else
  	 render 'new'
   end
  end
    
  def update
      @user_entity = UserEntity.find(params[:id])
    if @user_entity.update(user_params)
      flash[:success] = "Perfil atualizado"
      redirect_to @user_entity
    else
      render 'edit' 
    end
  end

 def destroy
    UserEntity.find(params[:id]).destroy
    flash[:success] = "Utilisador apagado"
    redirect_to user_entities_url
  end
  
  #def following
   # @title = "Following"
   # @user_entity = UserEntity.find(params[:id])
    #@user_entities = @user_entity.following.paginate(page: params[:page])
    #render 'show_follow'
  #end

  def followers
    @title = "Followers"
    @user_entity = UserEntity.find(params[:id])
    @user_entities = @user_entity.followers.paginate(page: params[:page])
    render 'show_follow'
  end
 
     #def set_user
      #  @user_entity = UserEntity.find(params[:id])
      #end
  private

  def logged_in_entity
    unless logged_in?
    store_location
    redirect_to newsession_url
   end
  end

  def correct_user
  @user_entity = UserEntity.find(params[:id])
  redirect_to(root_url) unless  current_entity?(@user_entity)
  end

  def user_params
     params.require(:user_entity).permit(:name, :email, :password, :confirmation_password,:address, :postal_cod, :contact, :nif,:locality,:professional_activity,:presentation, :image)
  end

  def admin
    redirect_to(root_url) unless current_user.admin?
  end

 end

