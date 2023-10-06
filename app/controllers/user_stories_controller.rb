class UserStoriesController < ApplicationController

  before_action :set_user_story, only: %i[show edit update destroy]

  def index
    @project = Project.find(params[:project_id]) if params[:project_id].present?
    @user_stories = UserStory.paginate(page: params[:page], per_page: 5)
  end

  def show
    @projects = Project.all
    @epics = Epic.all
  end

  def new
    @projects = Project.all
    @epics = Epic.all
    @user_story = UserStory.new
  end

  def create
    @projects = Project.all
    @epics = Epic.all
    @user_story = UserStory.new(user_story_params)
    if @user_story.save
      redirect_to @user_story
    else
      render :new
    end
  end

  def edit
    @projects = Project.all
  end

  def update
    @projects = Project.all
    if @user_story.update(user_story_params)
      redirect_to @user_story
    else
      render :edit
    end
  end

  def destroy
    @user_story.destroy
    redirect_to user_stories_path
  end

  private

  def set_user_story
    @user_story = UserStory.find(params[:id])
  end

  def user_story_params
    params.require(:user_story).permit(:name,
                                       :description,
                                       :epic_id,
                                       :status,
                                       :priority)
  end
end
