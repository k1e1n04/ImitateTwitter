class RelationshipsController < ApplicationController
  def followings_show
    @user  = User.find(params[:id])
    @users = @user.followings
  end

  def followers_show
    @user  = User.find(params[:id])
    @users = @user.followers
  end

  def create
    @users = User.find(params[:follow_id])
    following = current_user.follow(@users)
    if following.save
      flash[:success] = 'ユーザーをフォローしました'
      redirect_to @users
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      redirect_to @users
    end
  end

  def destroy
    @users = User.find(params[:follow_id])
    following = current_user.unfollow(@users)
    if following.destroy
      flash[:success] = 'ユーザーのフォローを解除しました'
      redirect_to @users
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      redirect_to @users
    end
  end
end
