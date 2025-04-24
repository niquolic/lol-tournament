class Player < ApplicationRecord
  belongs_to :team

  VALID_ROLES = ["Top laner", "Jungler", "Mid laner", "ADC", "Support"]

  validates :role, inclusion: { in: VALID_ROLES, message: "%{value} n'est pas un rôle valide" }
end
