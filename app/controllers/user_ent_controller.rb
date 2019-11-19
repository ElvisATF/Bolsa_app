class UserEntController < ApplicationController
  
	def show
		@user_ent = UserEnt.find(params[:id])
	end

  def new
  	@user_ent = UserEnt.new
  end

  def create
  @user_ent = UserEnt.new(user_params)
  if @user_ent.save
    
  	flash[:success] = "Welcome to Bolsa de Empregos!"
  	redirect_to @user_ent
    #redirect_to root_url
  else
    flash[:success] = "Falhou"
  	render 'new'
  end
  end

private

  #def user_ent_params
  #	params.permit(:name, :email, :password, :confirmation_password,:address, :postal_cod, :contact, :nif,:locality,:professional_activity,:presentation)
  #end

def user_params
    params.require(:user_ent).permit(:name, :email, :password, :confirmation_password,:address, :postal_cod, :contact, :nif,:locality,:professional_activity,:presentation)
  end

end
