class MakeJsonMaterializedViews < ActiveRecord::Migration
  def up
    execute('''
    CREATE MATERIALIZED VIEW user_options_json_cache AS

    SELECT
      array_to_json(array_agg(genders))::text as genders,
      array_to_json(array_agg(religions))::text as religions,
      array_to_json(array_agg(relationship_statuses))::text as relationship_statuses,
      array_to_json(array_agg(body_types))::text as body_types,
      array_to_json(array_agg(ethnicities))::text as ethnicities

    FROM
      genders, religions, relationship_statuses, body_types, ethnicities;

    REFRESH MATERIALIZED VIEW user_options_json_cache;
    ''')

  end

  def down
    execute('''DROP MATERIALIZED VIEW user_options_json_cache''')
  end
end
