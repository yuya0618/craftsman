class ProfilesController < ApplicationController

  def mypage
    @user = User.find(current_user.id)
    @mybuilds = Build.where(user_id:current_user.id).order("created_at DESC")
    @myreleases = Release.where(user_id:current_user.id).order("created_at DESC")
    @mylikes = Like.where(user_id:current_user.id).order("created_at DESC")
    @mycommentlikes = BuildCommentLike.where(user_id:current_user.id).order("created_at DESC")
    @myreleaselikes = ReleaseLike.where(user_id:current_user.id).order("created_at DESC")
  end

  def show
    @user = User.find_by(id: params[:id])
    @mybuilds = Build.where(user_id: @user.id).order("created_at DESC")
    @myreleases = Release.where(user_id: @user.id).order("created_at DESC")
    @mylikes = Like.where(user_id: @user.id).order("created_at DESC")
    @mycommentlikes = BuildCommentLike.where(user_id: @user.id).order("created_at DESC")
    @myreleaselikes = ReleaseLike.where(user_id: @user.id).order("created_at DESC")
  end

  def edit
    @user = current_user
  end

  def update
    user = current_user
    user.update(user_params) if user.id == current_user.id
    redirect_to mypage_profile_path(current_user)
  end

  private
    def user_params
      params.permit(:name, :text, :icon)
    end

end
