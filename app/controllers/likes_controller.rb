class LikesController < ApplicationController
  before_action :set_build, only: [:create, :destroy]

  def create
    @like = Like.create(user_id: current_user.id, build_id: params[:build_id])
    @likes = Like.where(build_id: params[:build_id])
    render 'create.js.erb'
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, build_id: params[:build_id])
    # binding.pry
    like.destroy
    # @likes = Like.where(build_id: params[:build_id])
    render 'destroy.js.erb'
  end

  private
    def set_build
      @build = Build.find(params[:build_id])
    end

end
  