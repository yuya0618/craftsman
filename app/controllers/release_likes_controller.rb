class ReleaseLikesController < ApplicationController
  before_action :set_release, only: [:create, :destroy]

  def create
    @like = ReleaseLike.create(user_id: current_user.id, release_id: params[:release_id])
    @likes = ReleaseLike.where(release_id: params[:release_id])
    render 'create.js.erb'
  end

  def destroy
    like = ReleaseLike.find_by(user_id: current_user.id, release_id: params[:release_id])
    like.destroy
    render 'destroy.js.erb'
  end

  private
    def set_release
      @release = Release.find(params[:release_id])
    end
end
