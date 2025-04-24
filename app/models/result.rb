class Result < ApplicationRecord
  belongs_to :match
  validates :home_team_score, presence: true
  validates :away_team_score, presence: true
  validate :no_scores_if_match_in_future

  def no_scores_if_match_in_future
    return if match.blank? || match.date.blank?

    if match.date.future? && (home_team_score.present? || away_team_score.present?)
      errors.add(:base, "Les scores ne peuvent être saisis que pour un match passé.")
    end
  end
end
