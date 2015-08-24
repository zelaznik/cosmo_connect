class AddDummyGenderPreferences < ActiveRecord::Migration
  # We added a trigger to create dummy records for desired_genders
  # whenever a new User is created.  This fills in the dummy records
  # for all of the users who had already been created.

  def up
    execute "DELETE FROM desired_genders"

    execute <<-SQL
      INSERT INTO desired_genders (
        user_id,
        gender_id,
        interested,
        created_at,
        updated_at
      )

      SELECT
        u.id user_id,
        g.id gender_id,
        false,
        u.created_at,
        u.created_at
      FROM
        genders g
      CROSS JOIN
        users u
      ;
    SQL
  end

  def down
  end
end
