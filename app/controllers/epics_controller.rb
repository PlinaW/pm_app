class EpicsController < ApplicationController

  before_action :set_epic, only: %i[show edit update destroy]

  def index
    if params[:project_id].present?
      @project = Project.find(params[:project_id])
      @epics = @project.epics.paginate(page: params[:page], per_page: 5)
    else
      @epics = Epic.paginate(page: params[:page], per_page: 5)
    end
  end

  def show
    @project = @epic.project
    @issues = Issue.where(epic: @epic)
  end

  def new
    @epic = Epic.new
  end

  def create
    @epic = Epic.new(epic_params)
    if @epic.save
      redirect_to @epic
    else
      render :new
    end
  end

  def edit; end

  def update
    if @epic.update(epic_params)
      redirect_to @epic
    else
      render :edit
    end
  end

  def destroy
    @epic.destroy
    redirect_to epics_path
  end

  private

  def set_epic
    @epic = Epic.find(params[:id])
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
