class RemovePreparationTimeAndAddPreparationHoursAndMinutesToTestResults < ActiveRecord::Migration[7.1]
  def change
    remove_column :test_results, :preparation_time, :integer
    add_column :test_results, :preparation_hours, :integer
    add_column :test_results, :preparation_minutes, :integer
  end
end
