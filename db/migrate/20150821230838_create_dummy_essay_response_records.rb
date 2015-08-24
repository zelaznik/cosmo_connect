class CreateDummyEssayResponseRecords < ActiveRecord::Migration
  # We added a trigger to create dummy records for essay responses
  # whenever a new User is created.  This fills in the dummy records
  # for all of the users who had already been created.

  def up
    execute <<-SQL
      INSERT INTO responses (
        user_id,
        response_category_id,
        created_at,
        updated_at
      )

      WITH x AS (
        SELECT
          u.id user_id,
          c.id response_category_id,
          u.updated_at
        FROM
          response_categories c
        CROSS JOIN
          users u
      )

      SELECT
         x.user_id,
         x.response_category_id,
         x.updated_at,
         x.updated_at

      FROM
        x
      LEFT JOIN
        responses r ON x.user_id = r.user_id
        AND x.response_category_id = r.response_category_id

      WHERE
        r.id IS NULL
      ;
    SQL
  end

  def down
  end
end
