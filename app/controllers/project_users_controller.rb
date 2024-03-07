class ProjectUsersController < ApplicationController

  before_action :set_project

  def index
    @project_users = User.joins(:project_users).where(project_users: { project_id: @project })
  end

  def invite
    email = params[:email]
    return redirect_to project_path(@project), alert: 'No email provided' if email.blank?

    user = User.find_by(email:) || User.invite!({ email: }, current_user)
    return redirect_to project_path(@project), alert: 'Email invalid' unless user.valid?

    user.project_users.find_or_create_by(project: @project, role: 0)

    redirect_to project_path(@project), notice: "#{email} was invited"
  end

  def destroy
    @project_user = @project.project_users.find(params[:id])
    @project_user.destroy
    redirect_to project_path(@project), notice: 'User removed from project'
  end

end
