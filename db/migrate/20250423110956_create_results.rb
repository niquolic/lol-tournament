class CreateResults < ActiveRecord::Migration[8.0]
  def change
    create_table :results do |t|
      t.references :match, null: false, foreign_key: true
      t.integer :home_team_score, null: false
      t.integer :away_team_score, null: false

      t.timestamps
    end
  end
end
