class BuildsController < ApplicationController
  before_action :set_build, only: [:show, :edit, :update, :destroy]
  before_action :move_to_signup, except: [:signup, :top, :introduce, :list]

  # GET /builds
  # GET /builds.json

  def signup
  end

  def introduce
  end

  def top
    @builds = Build.order("created_at DESC").limit(4)
    @releases = Release.order("created_at DESC").limit(4)
    @like = Like.new
    @build_ranks = Build.find(Like.group(:build_id).order('count(build_id) desc').limit(3).pluck(:build_id))
    @release_ranks = Release.find(ReleaseLike.group(:release_id).order('count(release_id) desc').limit(3).pluck(:release_id))
  end

  def index
    @builds = Build.all
  end

  # GET /builds/1
  # GET /builds/1.json
  def show
    @like = Like.where(user_id: current_user.id, build_id: params[:build_id])
    @build_comment_like = BuildCommentLike.where(user_id: current_user.id, build_comment_id: params[:build_comment_id])
  end

  # GET /builds/new
  def new
    @build = Build.new
  end

  # GET /builds/1/edit
  def edit
    if @build.user_id != current_user.id
      redirect_to build_path(@build)
    end
  end

  # POST /builds
  # POST /builds.json
  def create
    @build = Build.create!(build_params)
    redirect_to root_path
  end


  # PATCH/PUT /builds/1
  # PATCH/PUT /builds/1.json
  def update
    respond_to do |format|
      if @build.update(build_params)
        format.html { redirect_to @build, notice: 'Build was successfully updated.' }
        format.json { render :show, status: :ok, location: @build }
      else
        format.html { render :edit }
        format.json { render json: @build.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /builds/1
  # DELETE /builds/1.json
  def destroy
    @build.destroy if @build.user_id == current_user.id
    redirect_to root_path
  end

  def search
  end


  def list
    @all_builds = Build.page(params[:page]).per(10).order("created_at DESC")
    @like = Like.where(user_id: current_user&.id, build_id: params[:build_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_build
      @build = Build.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def build_params
      params.require(:build).permit(:title, :detail, :reward).merge(user_id: current_user.id)
    end

end
