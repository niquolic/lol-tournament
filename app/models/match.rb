class Match < ApplicationRecord
  belongs_to :home_team, class_name: 'Team'
  belongs_to :away_team, class_name: 'Team'
  has_one :result, dependent: :destroy

  validates :date, presence: true
  validates :home_team_id, presence: true
  validates :away_team_id, presence: true
  validate :both_teams_ready

  def both_teams_ready
    if home_team.players.empty? || away_team.players.empty?
      errors.add(:base, "Un match ne peut être programmé que si les deux équipes ont au moins un joueur.")
    end
  end
end
