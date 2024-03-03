class RenameRoleColumnToProjectUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :project_users, :roles, :role
  end
end
