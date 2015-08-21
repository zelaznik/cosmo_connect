class ReinstateVisitsUniqueVisitorProfile < ActiveRecord::Migration
  # The exact opposite of the migration: 
  # DropConstraintVisitsUniqueVisitorProfile

  def up
    remove_index :visits, [:visitor_id, :profile_id]
    add_index :visits, [:visitor_id, :profile_id], unique: true
  end

  def down
    remove_index :visits, column: [:visitor_id, :profile_id]
    add_index :visits, [:visitor_id, :profile_id]
  end

end
