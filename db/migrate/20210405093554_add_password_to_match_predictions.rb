class AddPasswordToMatchPredictions < ActiveRecord::Migration[6.0]
  def change
    add_column :match_predections, :password, :string
  end
end
