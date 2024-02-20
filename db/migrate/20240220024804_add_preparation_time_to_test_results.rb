class AddPreparationTimeToTestResults < ActiveRecord::Migration[7.1]
  def change
    add_column :test_results, :preparation_time_minutes, :integer
    remove_column :test_results, :preparation_hours
    remove_column :test_results, :preparation_minutes
  end
end
