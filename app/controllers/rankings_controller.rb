class RankingsController < ApplicationController
  def index
    teams = Team.all

    @rankings = teams.map do |team|
      matches = Match.includes(:result).where("(home_team_id = ? OR away_team_id = ?) AND results.id IS NOT NULL", team.id, team.id).joins(:result)

      played = matches.count
      wins = 0
      draws = 0
      losses = 0
      goals_for = 0
      goals_against = 0

      matches.each do |match|
        result = match.result
        is_home = match.home_team_id == team.id

        team_score = is_home ? result.home_team_score : result.away_team_score
        opponent_score = is_home ? result.away_team_score : result.home_team_score

        goals_for += team_score
        goals_against += opponent_score

        if team_score > opponent_score
          wins += 1
        elsif team_score == opponent_score
          draws += 1
        else
          losses += 1
        end
      end

      {
        team: team,
        played: played,
        wins: wins,
        draws: draws,
        losses: losses,
        goals_for: goals_for,
        goals_against: goals_against,
        goal_difference: goals_for - goals_against,
        points: wins * 3 + draws
      }
    end

    @rankings.sort_by! { |t| [-t[:points], -t[:goal_difference], -t[:goals_for]] }
  end
end
