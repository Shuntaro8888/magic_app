class RelationshipsController < ApplicationController
    before_action :logged_in_user

    def create
        @user = User.find(params[:followed_id]) # find the user to follow
        current_user.follow(@user) # create a relationship
        respond_to do |format|
            format.html { redirect_to @user } # redirect to the user's profile
            format.turbo_stream
        end
    end

    def destroy
        @user = Relationship.find(params[:id]).followed # find the user to unfollow
        current_user.unfollow(@user) # destroy the relationship
        respond_to do |format|
            format.html { redirect_to @user, status: :see_other }
            format.turbo_stream
        end
    end
end