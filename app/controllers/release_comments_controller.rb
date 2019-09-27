class ReleaseCommentsController < ApplicationController
  before_action :set_release_comment, only: [:destroy]


  def create
    @release_comment = ReleaseComment.create!(release_comment_params)
    redirect_to release_path(@release_comment.release_id)
  end

  def destroy
    @release_comment.destroy if @release_comment.user_id == current_user.id
    redirect_to release_path(@release_comment.release_id)
  end


  private

    def set_release_comment
      @release_comment = ReleaseComment.find(params[:id])
    end

    def release_comment_params
      params.permit(:detail).merge(user_id: current_user.id, release_id: params[:release_id])
    end

end
