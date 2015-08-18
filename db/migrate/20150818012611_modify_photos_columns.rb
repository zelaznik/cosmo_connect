class ModifyPhotosColumns < ActiveRecord::Migration
  def up
    remove_column :photos, :raw_data
    add_column :photos, :url, :string, null: false
    add_column :photos, :thumb_url, :string, null: false
  end

  def down
    add_column :photos, :raw_data, :binary, null: false
    remove_column :photos, :url
    remove_column :photos, :thumb_url
  end
end
