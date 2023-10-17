class IssuesController < ApplicationController
  before_action :set_current_project
  before_action :set_issue, only: %i[show edit update destroy]

  def index
    @issues = @current_project.issues.paginate(page: params[:page], per_page: 5)
  end

  def show; end

  def new
    @issue = @current_project.issues.new
  end

  def create
    @issue = @current_project.issues.new(issue_params)
    @issue.author = current_user
    if @issue.save
      @issue.issue_users.create(user: current_user)
      flash[:notice] = 'Issue was successfully created'
      redirect_to project_issue_path(@current_project, @issue)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @issue.update(issue_params)
      flash[:notice] = 'Issue was successfully updated'
      redirect_to project_issue_path(@current_project, @issue)
    else
      render :edit
    end
  end

  def destroy
    @issue.destroy
    redirect_to project_issues_path(@current_project)
  end

  private

  def set_issue
    @issue = @current_project.issues.find_by(id: params[:id])
    return unless @issue.nil?

    flash[:alert] = "This issue dosn't exist in this project"
    redirect_to project_issues_path(@current_project)
  end

  def issue_params
    params.require(:issue).permit(:name,
                                  :description,
                                  :epic_id,
                                  :status,
                                  :priority)
  end
end
