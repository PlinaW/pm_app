class ProjectsController < ApplicationController
  layout 'project', except: %i[show]
  before_action :set_project, only: %i[show edit update destroy]
  before_action :authorize_project_users, only: %i[show edit update destroy]

  def index
    @projects = current_user.projects.paginate(page: params[:page], per_page: 5)
  end

  def show
    @epics = Epic.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.start_date = Date.today
    if @project.save
      @project.project_users.create(user: current_user, role: 'admin')
      flash[:notice] = 'Project was successfuly created'
      redirect_to @project
    else
      render :new
    end
  end

  def edit; end

  def update
    if @project.update(project_params)
      flash[:notice] = 'Project was successfuly updated'
      redirect_to @project
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def authorize_project_users
    return if @project.users.include? current_user

    redirect_to projects_path,
                alert: 'You are not a member of this project'
  end

  def project_params
    params.require(:project).permit(:name,
                                    :description,
                                    :status,
                                    :start_date,
                                    :end_date)
  end

end
