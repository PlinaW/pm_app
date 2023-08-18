class RemovePriorityFromEpics < ActiveRecord::Migration[7.0]
  def change
    remove_column :epics, :priority, :integer
  end
end
