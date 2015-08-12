class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password_digest, null: false
      t.string :session_token, null: false

      t.datetime :birthdate, null: false
      t.integer :gender_id, null: false
      t.integer :min_age, null: false, default: 18
      t.integer :max_age, null: false, default: 92
      t.integer :max_radius, null: false, default: 50

      t.datetime :last_login
      t.datetime :last_logout
      t.timestamps null: false
    end

    add_index :users, :session_token, unique: true
    add_index :users, :username, unique: true
    add_foreign_key :users, :genders
  end

end
