class AddPasswordToIncreasePoints < ActiveRecord::Migration[6.0]
  def change
    add_column :increase_points, :password, :string
  end
end
