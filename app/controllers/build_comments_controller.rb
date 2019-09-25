class BuildCommentsController < ApplicationController

  def create
    @build_comment = BuildComment.create!(build_comment_params)
    redirect_to build_path(@build_comment.build_id)
  end


  private
    def build_comment_params
      params.permit(:title, :detail).merge(user_id: current_user.id, build_id: params[:build_id])
    end

end
