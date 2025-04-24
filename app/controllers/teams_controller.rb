class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  def index
    @teams = Team.order(:name)
  end

  def show
    @team = Team.find(params[:id])
    @players = @team.players
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to teams_path, notice: "Équipe créée avec succès."
    else
      render :new
    end
  end

  def edit
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      redirect_to teams_path, notice: "Équipe mise à jour avec succès."
    else
      render :edit
    end
  end

  def destroy
    @team.destroy
    redirect_to teams_path, notice: "Équipe supprimée."
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name)
  end
end
