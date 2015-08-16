class RemoveUserNotNullConstraints < ActiveRecord::Migration
  def change
    change_column :users, :birthdate, :datetime, null: true
    change_column :users, :gender_id, :integer, null: false
    change_column :users, :min_age, :integer, null: true, default: nil
    change_column :users, :max_age, :integer, null: true, default: nil
    change_column :users, :max_radius, :integer, null: true, default: nil
  end
end
