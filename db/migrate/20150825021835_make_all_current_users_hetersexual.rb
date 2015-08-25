class MakeAllCurrentUsersHetersexual < ActiveRecord::Migration
  def up
    execute "UPDATE desired_genders SET interested = False;"

    # Make dogs interested in other dogs
    # Make men interested in women and vice versa.
    [[1,2],[2,1],[4,4]].each do |x, y|
      execute "
      UPDATE
        desired_genders
      SET
        interested = True
      WHERE
        gender_id = #{x}
        AND user_id IN (
          SELECT id
          FROM users
          WHERE gender_id = #{y}
        );
      "
    end
  end

  def down
    # Do nothing
  end
end
