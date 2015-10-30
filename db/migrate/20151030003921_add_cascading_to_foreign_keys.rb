class AddCascadingToForeignKeys < ActiveRecord::Migration

  def up
    remove_foreign_key "desired_genders", name: "fk_rails_ac8d78ef71"
    remove_foreign_key "desired_genders", name: "fk_rails_c15204215a"
    remove_foreign_key "visits", name: "fk_rails_b156c396f4"
    remove_foreign_key "visits", name: "fk_rails_5118b56961"
    remove_foreign_key "matches", name: "fk_rails_3d5495eb35"
    remove_foreign_key "matches", name: "fk_rails_4154aab8fd"
    remove_foreign_key "messages", name: "fk_rails_b8f26a382d"
    remove_foreign_key "messages", name: "fk_rails_67c67d2963"
    remove_foreign_key "user_interest_links", name: "fk_rails_1d76cf6954"
    remove_foreign_key "user_interest_links", name: "fk_rails_a407c53dcd"
    remove_foreign_key "responses", name: "fk_rails_4bcdc22c1b"
    remove_foreign_key "responses", name: "fk_rails_2bd9a0753e"
    remove_foreign_key "photos", name: "fk_rails_c79d76afc0"
    remove_foreign_key "details_of_users", name: "fk_rails_06f41649f1"
    remove_foreign_key "details_of_users", name: "fk_rails_226f7867bd"
    remove_foreign_key "details_of_users", name: "fk_rails_cd4d9a2710"
    remove_foreign_key "details_of_users", name: "fk_rails_0e82c8a925"
    remove_foreign_key "details_of_users", name: "fk_rails_dc762f37c6"
    remove_foreign_key "users", name: "fk_rails_47055e3204"
    remove_foreign_key "default_preferences", name: "fk_rails_581ad36714"
    remove_foreign_key "default_preferences", name: "fk_rails_9ff6a2bac0"

    add_foreign_key "default_preferences", "genders", on_update: :cascade, on_delete: :cascade
    add_foreign_key "default_preferences", "genders", column: "desire_id", on_update: :cascade, on_delete: :cascade
    add_foreign_key "desired_genders", "genders", on_update: :cascade, on_delete: :cascade
    add_foreign_key "desired_genders", "users", on_update: :cascade, on_delete: :cascade
    add_foreign_key "details_of_users", "body_types", on_update: :cascade, on_delete: :cascade
    add_foreign_key "details_of_users", "ethnicities", on_update: :cascade, on_delete: :cascade
    add_foreign_key "details_of_users", "relationship_statuses", on_update: :cascade, on_delete: :cascade
    add_foreign_key "details_of_users", "religions", on_update: :cascade, on_delete: :cascade
    add_foreign_key "details_of_users", "users", on_update: :cascade, on_delete: :cascade
    add_foreign_key "matches", "users", column: "receiver_id", on_update: :cascade, on_delete: :cascade
    add_foreign_key "matches", "users", column: "sender_id", on_update: :cascade, on_delete: :cascade
    add_foreign_key "messages", "users", column: "receiver_id", on_update: :cascade, on_delete: :cascade
    add_foreign_key "messages", "users", column: "sender_id", on_update: :cascade, on_delete: :cascade
    add_foreign_key "photos", "users", on_update: :cascade, on_delete: :cascade
    add_foreign_key "responses", "response_categories", on_update: :cascade, on_delete: :cascade
    add_foreign_key "responses", "users", on_update: :cascade, on_delete: :cascade
    add_foreign_key "user_interest_links", "interests", on_update: :cascade, on_delete: :cascade
    add_foreign_key "user_interest_links", "users", on_update: :cascade, on_delete: :cascade
    add_foreign_key "users", "genders", on_update: :cascade, on_delete: :cascade
    add_foreign_key "visits", "users", column: "profile_id", on_update: :cascade, on_delete: :cascade
    add_foreign_key "visits", "users", column: "visitor_id", on_update: :cascade, on_delete: :cascade
  end

  def down
    remove_foreign_key "default_preferences", "genders", on_update: :cascade, on_delete: :cascade
    remove_foreign_key "default_preferences", "genders", column: "desire_id", on_update: :cascade, on_delete: :cascade
    remove_foreign_key "desired_genders", "genders", on_update: :cascade, on_delete: :cascade
    remove_foreign_key "desired_genders", "users", on_update: :cascade, on_delete: :cascade
    remove_foreign_key "details_of_users", "body_types", on_update: :cascade, on_delete: :cascade
    remove_foreign_key "details_of_users", "ethnicities", on_update: :cascade, on_delete: :cascade
    remove_foreign_key "details_of_users", "relationship_statuses", on_update: :cascade, on_delete: :cascade
    remove_foreign_key "details_of_users", "religions", on_update: :cascade, on_delete: :cascade
    remove_foreign_key "details_of_users", "users", on_update: :cascade, on_delete: :cascade
    remove_foreign_key "matches", "users", column: "receiver_id", on_update: :cascade, on_delete: :cascade
    remove_foreign_key "matches", "users", column: "sender_id", on_update: :cascade, on_delete: :cascade
    remove_foreign_key "messages", "users", column: "receiver_id", on_update: :cascade, on_delete: :cascade
    remove_foreign_key "messages", "users", column: "sender_id", on_update: :cascade, on_delete: :cascade
    remove_foreign_key "photos", "users", on_update: :cascade, on_delete: :cascade
    remove_foreign_key "responses", "response_categories", on_update: :cascade, on_delete: :cascade
    remove_foreign_key "responses", "users", on_update: :cascade, on_delete: :cascade
    remove_foreign_key "user_interest_links", "interests", on_update: :cascade, on_delete: :cascade
    remove_foreign_key "user_interest_links", "users", on_update: :cascade, on_delete: :cascade
    remove_foreign_key "users", "genders", on_update: :cascade, on_delete: :cascade
    remove_foreign_key "visits", "users", column: "profile_id", on_update: :cascade, on_delete: :cascade
    remove_foreign_key "visits", "users", column: "visitor_id", on_update: :cascade, on_delete: :cascade

    add_foreign_key "default_preferences", "genders"
    add_foreign_key "default_preferences", "genders", column: "desire_id"
    add_foreign_key "desired_genders", "genders"
    add_foreign_key "desired_genders", "users"
    add_foreign_key "details_of_users", "body_types"
    add_foreign_key "details_of_users", "ethnicities"
    add_foreign_key "details_of_users", "relationship_statuses"
    add_foreign_key "details_of_users", "religions"
    add_foreign_key "details_of_users", "users"
    add_foreign_key "matches", "users", column: "receiver_id"
    add_foreign_key "matches", "users", column: "sender_id"
    add_foreign_key "messages", "users", column: "receiver_id"
    add_foreign_key "messages", "users", column: "sender_id"
    add_foreign_key "photos", "users"
    add_foreign_key "responses", "response_categories"
    add_foreign_key "responses", "users"
    add_foreign_key "user_interest_links", "interests"
    add_foreign_key "user_interest_links", "users"
    add_foreign_key "users", "genders"
    add_foreign_key "visits", "users", column: "profile_id"
    add_foreign_key "visits", "users", column: "visitor_id"

  end

end
