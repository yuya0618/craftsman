class BuildReactionsController < ApplicationController

  def create
    @build_reaction = BuildReaction.create!(build_reaction_params)
    redirect_to build_path(@build_reaction.build_id)
  end


  private
    def build_reaction_params
      params.permit(:detail).merge(user_id: current_user.id, build_id: params[:build_id], build_comment_id: params[:build_comment_id])
    end

end
