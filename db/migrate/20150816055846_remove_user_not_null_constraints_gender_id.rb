class RemoveUserNotNullConstraintsGenderId < ActiveRecord::Migration
  def change
    change_column :users, :gender_id, :integer, null: true
  end
end
