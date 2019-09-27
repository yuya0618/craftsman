class BuildReactionsController < ApplicationController
  before_action :set_build_reaction, only: [:destroy]

  def create
    @build_reaction = BuildReaction.create!(build_reaction_params)
    redirect_to build_path(@build_reaction.build_id)
  end

  def destroy
    @build_reaction.destroy if @build_reaction.user_id == current_user.id
    redirect_to build_path(@build_reaction.build_id)
  end

  private

    def set_build_reaction
      @build_reaction = BuildReaction.find(params[:id])
    end

    def build_reaction_params
      params.permit(:detail).merge(user_id: current_user.id, build_id: params[:build_id], build_comment_id: params[:build_comment_id])
    end

end
