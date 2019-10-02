class BuildCommentLikesController < ApplicationController
  before_action :set_build_comment, only: [:create, :destroy]

  def create
    @like = BuildCommentLike.create(user_id: current_user.id, build_comment_id: params[:build_comment_id])
    @likes = BuildCommentLike.where(build_comment_id: params[:build_comment_id])
    render 'create.js.erb'
  end

  def destroy
    like = BuildCommentLike.find_by(user_id: current_user.id, build_comment_id: params[:build_comment_id])
    like.destroy
    # @likes = Like.where(build_id: params[:build_id])
    render 'destroy.js.erb'
  end

  private
    def set_build_comment
      @build_comment = BuildComment.find(params[:build_comment_id])
    end
end
