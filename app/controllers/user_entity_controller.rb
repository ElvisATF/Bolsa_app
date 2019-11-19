class UserEntityController < ApplicationController
  
	def show
		@user_entity = UserEntity.find(params[:id])
	end

  def new
  	@user_entity = UserEntity.new
  end

  def create
  @user_entity = UserEntity.new(user_params)
  if @user_entity.save
  	flash[:success] = "Welcome to Bolsa de Empregos!"
  	redirect_to @user_entity
    #redirect_to root_url
  else
    flash[:success] = "Falhou"
  	render 'new'
  end
  end

private

  def user_params
  
  	params.permit(:name, :email, :password, :confirmation_password,:address, :postal_cod, :contact, :nif,:locality,:professional_activity,:presentation)
  end

#def user_params
 #  params.require(:user_entity).permit(:name, :email, :password, :confirmation_password,:address, :postal_cod, :contact, :nif,:locality,:professional_activity,:presentation)
#end

def edit
@user_entity = UserEntity.find(params[:id])
end

end
