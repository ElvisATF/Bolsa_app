class RelationshipsController < ApplicationController
    before_action :logged_in_entity
    
    def create
        @user_entity = UserEntity.find(params[:followed_id])
        current_user_user.follow(@user_entity)
        redirect_to user_entity
    end

    def destroy
        @user = Relationship.find(params[:id]).followed
        current_user_user.unfollow(@user_entity)
        respond_to do |format|
            format.html { redirect_to request.referrer }
            format.js
        end
    end
end