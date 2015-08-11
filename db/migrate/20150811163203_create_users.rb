class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password_digest, null: false
      t.string :session_token, null: false

      t.datetime :birthdate, null: false
      t.integer :gender_id, null: false
      t.integer :min_age, null: false
      t.integer :max_age, null: false
      t.integer :max_radius, null: false

      t.datetime :last_login, null: false
      t.timestamps null: false
    end

    add_index :users, :session_token, unique: true
    add_index :users, :username, unique: true
    add_foreign_key :users, :genders
  end

end
