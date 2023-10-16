class EpicsController < ApplicationController

  before_action :set_current_project
  before_action :set_epic, only: %i[show edit update destroy]

  def index
    @epics = @current_project.epics.paginate(page: params[:page], per_page: 5)
  end

  def show
    @issues = Issue.where(epic: @epic)
  end

  def new
    @epic = @current_project.epics.new
  end

  def create
    @epic = @current_project.epics.new(epic_params)
    if @epic.save
      redirect_to project_epic_path(@current_project, @epic)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @epic.update(epic_params)
      redirect_to project_epic_path(@current_project, @epic)
    else
      render :edit
    end
  end

  def destroy
    @epic.destroy
    redirect_to project_epics_path
  end

  private

  def set_epic
    @epic = @current_project.epics.find_by(id: params[:id])
    return unless @epic.nil?

    flash[:alert] = "This epic doesn't exist in this project"
    redirect_to project_epics_path(@current_project)
  end

  def epic_params
    params.require(:epic).permit(:name,
                                 :description,
                                 :project_id,
                                 :status,
                                 :start_date,
                                 :end_date)
  end
end
