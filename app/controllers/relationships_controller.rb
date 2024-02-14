class RelationshipsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    current_user.follow(@user)
    @user.create_notification_follow!(current_user)
    render turbo_stream: turbo_stream.replace(
      "follow-ajax-#{@user.id}",
      partial: 'relationships/btn',
      locals: { user: @user, followed: true },
    )
  end
  
  def destroy
    @user = User.find(params[:user_id])
    current_user.unfollow(@user)
    render turbo_stream: turbo_stream.replace(
      "follow-ajax-#{@user.id}",
      partial: 'relationships/btn',
      locals: { user: @user, followed: false },
    )
  end
  
  def followings
    @user = User.find(params[:user_id])
    @users = @user.followings
  end
  
  def followers
    @user = User.find(params[:user_id])
    @users = @user.followers
  end
end
