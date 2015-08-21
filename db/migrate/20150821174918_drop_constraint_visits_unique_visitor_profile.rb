class DropConstraintVisitsUniqueVisitorProfile < ActiveRecord::Migration
  def up
    remove_index :visits, column: [:visitor_id, :profile_id]
    add_index :visits, [:visitor_id, :profile_id]
  end

  def down
    remove_index :visits, [:visitor_id, :profile_id]
    add_index :visits, [:visitor_id, :profile_id], unique: true
  end

end
