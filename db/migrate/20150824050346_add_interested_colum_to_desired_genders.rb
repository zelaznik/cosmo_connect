class AddInterestedColumToDesiredGenders < ActiveRecord::Migration
  def change
    add_column :desired_genders, :interested, :boolean, default: false, null: false
  end
end
