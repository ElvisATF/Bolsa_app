class BackofficesController < ApplicationController

  def index_back
  end

   def index
    @user_entity = UserEntity.paginate(page: params[:page])
  end

	def show
		@user_entity = UserEntity.find(params[:id])
	end

end