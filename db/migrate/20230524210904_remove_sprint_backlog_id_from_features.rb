class RemoveSprintBacklogIdFromFeatures < ActiveRecord::Migration[7.0]
  def change
    remove_column :features, :sprint_backlog_id, :bigint
  end
end
