class OnePhotoPerUser < ActiveRecord::Migration
  def up
    remove_index :photos, :user_id
    add_index :photos, :user_id, unique: true
  end

  def down
    remove_index :photos, :user_id, unique: true
    add_index :photos, :user_id
  end
end
