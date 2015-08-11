class CreateDesiredGenders < ActiveRecord::Migration
  def change
    create_table :desired_genders do |t|
      t.integer :user_id
      t.integer :gender_id

      t.timestamps null: false
    end

    add_index :desired_genders, :user_id
    add_index :desired_genders, :gender_id
    add_index :desired_genders, [:user_id, :gender_id], unique: true

    add_foreign_key :desired_genders, :users
    add_foreign_key :desired_genders, :genders
  end
end
