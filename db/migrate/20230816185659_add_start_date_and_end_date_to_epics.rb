class AddStartDateAndEndDateToEpics < ActiveRecord::Migration[7.0]
  def change
    add_column :epics, :start_date, :date
    add_column :epics, :end_date, :date
  end
end
