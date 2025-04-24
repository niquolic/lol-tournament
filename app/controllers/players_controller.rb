class PlayersController < ApplicationController
  before_action :set_team, only: [:new, :create]

  def index
    @players = Player.order(:last_name)
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @team = Team.find(params[:team_id])
    if @team.players.count >= 5
      redirect_to team_path(@team), alert: "Cette équipe a déjà 5 joueurs. Vous ne pouvez pas en ajouter davantage."
    else
      @player = @team.players.build
    end
  end

  def create
    @player = @team.players.build(player_params)
    if @player.save
      redirect_to team_path(@team), notice: "Joueur ajouté."
    else
      render :new
    end
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    if @player.update(player_params)
      redirect_to team_path(@player.team), notice: "Joueur mis à jour avec succès."
    else
      render :edit
    end
  end

  def destroy
    @player = Player.find(params[:id])
    team = @player.team
    @player.destroy
    redirect_to team_path(team), notice: "Joueur supprimé avec succès."
  end

  private

  def set_team
    @team = Team.find(params[:team_id])
  end

  def player_params
    params.require(:player).permit(:first_name, :last_name, :role)
  end
end
