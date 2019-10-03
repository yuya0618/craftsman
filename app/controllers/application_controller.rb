class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def set_search
    @search = Build.ransack(params[:q])
    @search_builds = @search.result
  end


  def move_to_signup
    redirect_to signup_builds_path unless user_signed_in?
  end

end
