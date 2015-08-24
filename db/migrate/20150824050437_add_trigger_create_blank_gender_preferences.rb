class AddTriggerCreateBlankGenderPreferences < ActiveRecord::Migration
  def up
    execute "DROP TRIGGER IF EXISTS trg_aft_ins_users ON users;"
    execute "DROP FUNCTION IF EXISTS _trg_aft_ins_users();"

    execute "
    CREATE FUNCTION _trg_aft_ins_users()
    RETURNS TRIGGER AS $$
      BEGIN
        INSERT INTO desired_genders (
        gender_id, user_id, created_at, updated_at)
        SELECT id, NEW.id, NEW.created_at, NEW.created_at
        FROM genders;

        INSERT INTO responses (
        response_category_id, user_id, created_at, updated_at)
        SELECT id, NEW.id, NEW.updated_at, NEW.updated_at
        FROM response_categories;

        RETURN NULL;
      END
    $$ LANGUAGE 'plpgsql';"

    execute "
    CREATE TRIGGER trg_aft_ins_users AFTER INSERT ON users
    FOR EACH ROW EXECUTE PROCEDURE _trg_aft_ins_users();"
  end

  def down
    execute "DROP TRIGGER IF EXISTS trg_aft_ins_users ON users;"
    execute "DROP FUNCTION IF EXISTS _trg_aft_ins_users();"

    execute "
    CREATE FUNCTION _trg_aft_ins_users()
    RETURNS TRIGGER AS $$
      BEGIN
        INSERT INTO responses (
        response_category_id, user_id, created_at, updated_at)
        SELECT id, NEW.id, NEW.updated_at, NEW.updated_at
        FROM response_categories;
        RETURN NULL;
      END
    $$ LANGUAGE 'plpgsql';"

    execute "
    CREATE TRIGGER trg_aft_ins_users AFTER INSERT ON users
    FOR EACH ROW EXECUTE PROCEDURE _trg_aft_ins_users();"
  end
end
