class CreateWinnerTeamsUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :winner_teams_users do |t|
      t.string :date
      t.string :winners1
      t.string :winners2
      t.string :team1
      t.string :team2
      t.string :match1
      t.string :match2

      t.timestamps
    end
  end
end
