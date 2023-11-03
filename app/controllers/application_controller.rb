class ApplicationController < ActionController::Base
  layout :layout_by_resource
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name])
  end

  def after_sign_in_path_for(_resource)
    home_path
  end

  private

  def set_current_project
    @current_project = Project.find(params[:project_id])
  end

  def layout_by_resource
    if devise_controller?
      'devise/devise'
    else
      'application'
    end
  end
end
