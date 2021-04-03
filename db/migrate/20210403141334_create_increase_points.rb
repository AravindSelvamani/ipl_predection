class CreateIncreasePoints < ActiveRecord::Migration[6.0]
  def change
    create_table :increase_points do |t|
      t.string :date
      t.string :winner1
      t.string :winner2

      t.timestamps
    end
  end
end
