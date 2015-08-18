class RemoveUserNotNullConstraintsGenderId < ActiveRecord::Migration
  def up
    change_column :users, :gender_id, :integer, null: true
  end

  def down
    change_column :users, :gender_id, null: false
  end
end
