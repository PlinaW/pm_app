class ProjectsController < ApplicationController

  before_action :set_project, only: %i[show edit update destroy]

  def index
    @projects = Project.paginate(page: params[:page], per_page: 5)
  end

  def show; end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project
    else
      render :new
    end
  end

  def edit; end

  def update
    if @project.update(project_params)
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

  def project_params
    params.require(:project).permit(:name,
                                    :description,
                                    :status,
                                    :start_date,
                                    :end_date)
  end

end
