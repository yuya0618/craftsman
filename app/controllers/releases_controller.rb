class ReleasesController < ApplicationController
  before_action :set_release, only: [:show, :edit, :update, :destroy]

  def index
    @releases = Release.all
  end

  def show
    @like = ReleaseLike.where(user_id: current_user.id, release_id: params[:release_id])
  end

  def new
    @release = Release.new
  end

  def edit
    if @release.user_id != current_user.id
      redirect_to release_path(@release)
    end
  end


  def create
    @release = Release.create!(release_params)
    redirect_to root_path
  end

  def update
    respond_to do |format|
      if @release.update(release_params)
        format.html { redirect_to @release, notice: 'Release was successfully updated.' }
        format.json { render :show, status: :ok, location: @release }
      else
        format.html { render :edit }
        format.json { render json: @release.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @release.destroy if @release.user_id == current_user.id
    redirect_to root_path
  end

  def list
    @all_releases = Release.page(params[:page]).per(10).order("created_at DESC")
    @like = ReleaseLike.where(user_id: current_user.id, release_id: params[:release_id])
  end

  private
    def set_release
      @release = Release.find(params[:id])
    end

    def release_params
      params.require(:release).permit(:title, :detail).merge(user_id: current_user.id)
    end
end
