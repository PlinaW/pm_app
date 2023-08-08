class RemoveContextFromEpics < ActiveRecord::Migration[7.0]
  def change
    remove_column :epics, :context, :string
  end
end
