class ProjectUsersController < ApplicationController

  before_action :set_current_project

  def invite
    email = params[:email]
    return redirect_to project_path(@current_project), alert: 'No email provided' if email.blank?

    user = User.find_by(email:) || User.invite!({ email: }, current_user)
    return redirect_to project_path(@current_project), alert: 'Email invalid' unless user.valid?

    user.project_users.find_or_create_by(project: @current_project, roles: 0)

    redirect_to project_path(@current_project), notice: "#{email} was invited"
  end

  def destroy
    @project_user = @current_project.project_users.find(params[:id])
    @project_user.destroy
    redirect_to project_path(@current_project), notice: 'User removed from project'
  end

end
