class ReleaseCommentsController < ApplicationController

  def create
    @release_comment = ReleaseComment.create!(release_comment_params)
    redirect_to release_path(@release_comment.release_id)
  end


  private
    def release_comment_params
      params.permit(:detail).merge(user_id: current_user.id, release_id: params[:release_id])
    end

end
