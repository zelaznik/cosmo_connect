class AddTriggerBlankEssaysAfterNewCategory < ActiveRecord::Migration
  def up
    execute "
    CREATE FUNCTION _trg_aft_ins_response_categories()
    RETURNS TRIGGER AS $$
      BEGIN
        INSERT INTO responses (
        response_category_id, user_id, created_at, updated_at)
        SELECT NEW.id, id, NEW.updated_at, NEW.updated_at
        FROM users;
        RETURN NULL;
      END
    $$ LANGUAGE 'plpgsql';"

    execute "
    CREATE TRIGGER trg_aft_ins_response_categories AFTER INSERT ON response_categories
    FOR EACH ROW EXECUTE PROCEDURE _trg_aft_ins_response_categories();"
  end

  def down
    execute "DROP TRIGGER IF EXISTS trg_aft_ins_response_categories ON response_categories;"
    execute "DROP FUNCTION IF EXISTS _trg_aft_ins_response_categories();"
  end
end
