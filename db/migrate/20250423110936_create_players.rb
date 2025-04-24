class CreatePlayers < ActiveRecord::Migration[8.0]
  def change
    create_table :players do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :role, null: false
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
