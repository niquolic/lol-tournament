# Création des équipes
team1 = Team.create!(name: "Team Zizou")
team2 = Team.create!(name: "Team Fraude")
team3 = Team.create!(name: "Team Pas inspi") # Équipe sans joueurs

# Création des joueurs pour Team Alpha
5.times do |i|
  Player.create!(
    first_name: "AlphaPlayer#{i + 1}",
    last_name: "LastName#{i + 1}",
    role: ["Top laner", "Jungler", "Mid laner", "ADC", "Support"][i],
    team: team1
  )
end

# Création des joueurs pour Team Beta
5.times do |i|
  Player.create!(
    first_name: "BetaPlayer#{i + 1}",
    last_name: "LastName#{i + 1}",
    role: ["Top laner", "Jungler", "Mid laner", "ADC", "Support"][i],
    team: team2
  )
end

# Création des matchs
match1 = Match.create!(
  date: 2.days.ago,
  home_team: team1,
  away_team: team2
)
match1.create_result!(
  home_team_score: 3,
  away_team_score: 2
)

match2 = Match.create!(
  date: 1.week.ago,
  home_team: team2,
  away_team: team1
)
match2.create_result!(
  home_team_score: 1,
  away_team_score: 4
)

Match.create!(
  date: 3.weeks.from_now,
  home_team: team1,
  away_team: team2
)

# Création d'un compte admin
AdminUser.create!(
  email: "admin@example.com",
  password: "password"
)