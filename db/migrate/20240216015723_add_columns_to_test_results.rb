class AddColumnsToTestResults < ActiveRecord::Migration[7.1]
  def change
    add_column :test_results, :test_date, :date
    add_column :test_results, :test_type, :string
    add_column :test_results, :preparation_time, :integer
  end
end
