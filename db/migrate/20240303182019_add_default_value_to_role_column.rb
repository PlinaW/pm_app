class AddDefaultValueToRoleColumn < ActiveRecord::Migration[7.1]
  def change
    change_column_default(:project_users, :role, 0)
  end
end
