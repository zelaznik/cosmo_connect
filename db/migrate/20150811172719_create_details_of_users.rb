class CreateDetailsOfUsers < ActiveRecord::Migration
  def change
    create_table :details_of_users do |t|
      t.integer :user_id, null: false
      t.datetime :last_online
      t.integer :ethnicity_id
      t.decimal :height
      t.integer :body_type_id
      t.integer :relationship_status_id
      t.integer :religion_id

      t.integer :zip_code
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps null: false
    end

    add_index :details_of_users, :user_id
    add_index :details_of_users, :ethnicity_id
    add_index :details_of_users, :height
    add_index :details_of_users, :body_type_id
    add_index :details_of_users, :relationship_status_id
    add_index :details_of_users, :religion_id

    add_foreign_key :details_of_users, :users
    add_foreign_key :details_of_users, :ethnicities
    add_foreign_key :details_of_users, :body_types
    add_foreign_key :details_of_users, :relationship_statuses
    add_foreign_key :details_of_users, :religions
  end
end
