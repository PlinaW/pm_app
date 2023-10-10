class RenameIssuesToIssues < ActiveRecord::Migration[7.0]
  def change
    rename_table :issues, :issues
  end
end
