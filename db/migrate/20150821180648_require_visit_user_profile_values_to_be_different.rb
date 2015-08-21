class RequireVisitUserProfileValuesToBeDifferent < ActiveRecord::Migration
  def up
    execute 'ALTER TABLE visits ADD CONSTRAINT check_visits_visitor_neq_profile CHECK (visitor_id != profile_id)'
  end

  def down
    execute 'ALTER TABLE visits DROP CONSTRAINT IF EXISTS check_visits_visitor_neq_profile'
  end
end
