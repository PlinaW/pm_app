class AddSprintBacklogRefToFeatures < ActiveRecord::Migration[7.0]
  def change
    add_reference :features, :sprint_backlog, foreign_key: true
  end
end
