class RelationsController < ApplicationController
    before_action :logged_in_entity
    
    def create
        @user = User.find(params[:followed_id])
        current_user_user.follow(@user)
        respond_to do |format|
            format.html { redirect_to request.referrer }
            format.js
        end
    end

    def destroy
        @user = Relation.find(params[:id]).followed
        current_user_user.unfollow(@user
        respond_to do |format|
            format.html { redirect_to request.referrer }
            format.js
        end
    end
end