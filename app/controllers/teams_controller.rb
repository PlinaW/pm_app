class TeamsController < ApplicationController
  before_action :set_project
  before_action :set_team, only: %i[show edit update destroy]
  before_action :authorize_team_users, only: %i[show edit update destroy]

  def index
    @teams = @project.teams
  end

  def show; end

  def new
    @team = @project.teams.new
  end

  def create
    @team = @project.teams.new(team_params)
    if @team.save
      @team.team_users.create(user: current_user, role: 'team_leader')
      flash[:notice] = 'Team was successfuly created'
      redirect_to @team
    else
      render :new
    end
  end

  def edit; end

  def update
    if @team.update(team_params)
      flash[:notice] = 'Team was successfuly updated'
      redirect_to @team
    else
      render :edit
    end
  end

  def destroy
    @team.destroy
    redirect_to teams_path
  end

  private

  def set_team
    @team = @project.teams.find(params[:id])
  end

  def authorize_team_users
    return if @team.users.include? current_user

    redirect_to teams_path,
                alert: 'You are not a member of this team'
  end

  def team_params
    params.require(:team).permit(:name)
  end

end
