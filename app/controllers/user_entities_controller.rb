class UserEntitiesController < ApplicationController
  
	def show
		@user_entity = UserEntity.find(params[:id])
	end

  def new
  	@user_entity = UserEntity.new
  end

  def create
    @user_entity = UserEntity.new(user_params)
  if @user_entity.save
    log_in @user_entity
  	flash[:success] = "Welcome to Bolsa de Empregos!"
  	redirect_to @user_entity
    #redirect_to root_url
  else
  	render 'new'
  end
  end
  
def edit
@user_entity = UserEntity.find(params[:id])
end

def update
@user_entity = UserEntity.find(params[:id])
if @user_entity.update(user_params)
flash[:success] = "Profile updated"
redirect_to @user_entity
else
render 'edit' 
end

  
end
private
  #def user_params
  
  #	params.permit(:name, :email, :password, :confirmation_password,:address, :postal_cod, :contact, :nif,:locality,:professional_activity,:presentation)
  #end

def user_params
   params.require(:user_entity).permit(:name, :email, :password, :confirmation_password,:address, :postal_cod, :contact, :nif,:locality,:professional_activity,:presentation)
end

end
