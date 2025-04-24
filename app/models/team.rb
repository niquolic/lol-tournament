class Team < ApplicationRecord
  has_many :players, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  validate :max_five_players

  private

  def max_five_players
    if players.size > 5
      errors.add(:base, "Une équipe ne peut pas avoir plus de 5 joueurs.")
    end
  end
end
