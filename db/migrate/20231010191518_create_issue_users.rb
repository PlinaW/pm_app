class CreateIssueUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :issue_users do |t|
      t.references :issue, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end