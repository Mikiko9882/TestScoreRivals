class CreateNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :notification do |t|
      t.integer :visitor_id, null: false
      t.integer :visited_id, null: false
      t.string :action, default: '', null: false
      t.boolean :checked, default: false, null: false


      t.timestamps
    end

    add_index :notification, :visitor_id
    add_index :notification, :visited_id
  end
end
