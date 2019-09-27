class BuildCommentsController < ApplicationController
  before_action :set_build_comment, only: [:edit, :update, :destroy]

  def create
    @build_comment = BuildComment.create!(build_comment_params)
    redirect_to build_path(@build_comment.build_id)
  end

  def edit
  end

  def update
    @build_comment.update(build_comment_params)
    redirect_to build_path(params[:build_id])
  end

  def destroy
    @build_comment.destroy if @build_comment.user_id == current_user.id
    redirect_to build_path(@build_comment.build_id)
  end


  private

    def set_build_comment
      @build_comment = BuildComment.find(params[:id])
    end

    def build_comment_params
      params.permit(:title, :detail).merge(user_id: current_user.id, build_id: params[:build_id])
    end

end
