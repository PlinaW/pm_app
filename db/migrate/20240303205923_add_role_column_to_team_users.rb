class AddRoleColumnToTeamUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :team_users, :role, :integer, default: 0
  end
end
