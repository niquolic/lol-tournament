class MatchesController < ApplicationController
  before_action :authenticate_admin!, only: [:create, :edit, :update]

  def index
    @matches = Match.order(date: :desc)
  end

  def show
    @match = Match.find(params[:id])
  end

  def new
    @match = Match.new
    @teams = Team.all
  end

  def create
    @match = Match.new(match_params)
    @teams = Team.all
    if @match.save
      if @match.date <= Time.now
        result_params = { home_team_score: params[:match][:home_team_score], away_team_score: params[:match][:away_team_score] }
        @match.create_result(result_params)
      end
      redirect_to matches_path, notice: "Match créé avec succès."
    else
      render :new
    end
  end

  def edit
    @match = Match.find(params[:id])
  end

  def update
    @match = Match.find(params[:id])
    @result = @match.result || @match.build_result

    result_params = {
      home_team_score: params[:match][:home_team_score],
      away_team_score: params[:match][:away_team_score]
    }

    if @result.update(result_params) && @match.update(match_params)
      redirect_to matches_path, notice: "Match mis à jour."
    else
      render :edit
    end
  end

  def destroy
    @match = Match.find(params[:id])
    @match.destroy
    redirect_to matches_path, notice: "Match supprimé."
  end

  private

  def match_params
    params.require(:match).permit(:date, :home_team_id, :away_team_id)
  end

  def authenticate_admin!
    unless session[:admin_user_id]
      redirect_to root_path, alert: "Accès réservé aux administrateurs."
    end
  end
end
