class CreateMatchPredections < ActiveRecord::Migration[6.0]
  def change
    create_table :match_predections do |t|
      t.string :name
      t.string :date
      t.string :winners1
      t.string :winners2

      t.timestamps
    end
  end
end
