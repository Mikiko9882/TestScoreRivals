class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email,            null: false, index: { unique: true }
      t.string :crypted_password
      t.string :salt
      t.string :first_name, null: false
      t.string :last_name, null:false
      t.string :nickname, null: false
      t.string :grade_and_class, null: false

      t.timestamps
    end
  end
end
