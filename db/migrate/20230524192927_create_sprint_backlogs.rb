class CreateSprintBacklogs < ActiveRecord::Migration[7.0]
  def change
    create_table :sprint_backlogs do |t|
      t.string :name
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.references :product_backlog, null: false, foreign_key: true

      t.timestamps
    end
  end
end
