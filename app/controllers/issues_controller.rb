class IssuesController < ApplicationController

  before_action :set_issue, only: %i[show edit update destroy]

  def index
    @project = Project.find(params[:project_id]) if params[:project_id].present?
    @issues = Issue.paginate(page: params[:page], per_page: 5)
  end

  def show
    @projects = Project.all
    @epics = Epic.all
  end

  def new
    @projects = Project.all
    @epics = Epic.all
    @issue = Issue.new
  end

  def create
    @projects = Project.all
    @epics = Epic.all
    @issue = Issue.new(issue_params)
    if @issue.save
      redirect_to @issue
    else
      render :new
    end
  end

  def edit
    @projects = Project.all
  end

  def update
    @projects = Project.all
    if @issue.update(issue_params)
      redirect_to @issue
    else
      render :edit
    end
  end

  def destroy
    @issue.destroy
    redirect_to issues_path
  end

  private

  def set_issue
    @issue = Issue.find(params[:id])
  end

  def issue_params
    params.require(:issue).permit(:name,
                                  :description,
                                  :epic_id,
                                  :status,
                                  :priority)
  end
end
