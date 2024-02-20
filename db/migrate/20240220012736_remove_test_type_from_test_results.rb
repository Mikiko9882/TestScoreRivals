class RemoveTestTypeFromTestResults < ActiveRecord::Migration[7.1]
  def change
    remove_column :test_results, :test_type
  end
end
