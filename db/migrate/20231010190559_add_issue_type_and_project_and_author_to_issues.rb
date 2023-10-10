class AddIssueTypeAndProjectAndAuthorToIssues < ActiveRecord::Migration[7.0]
  def change
    add_column :issues, :issue_type, :string
    add_reference :issues, :project, foreign_key: true
    add_reference :issues, :author, foreign_key: { to_table: :users }
  end
end
