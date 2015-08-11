class CreateUserInterestLinks < ActiveRecord::Migration
  def change
    create_table :user_interest_links do |t|
      t.integer :user_id
      t.integer :interest_id

      t.timestamps null: false
    end

    add_index :user_interest_links, :user_id
    add_index :user_interest_links, :interest_id
    add_index :user_interest_links, [:user_id, :interest_id], unique: true

    add_foreign_key :user_interest_links, :users
    add_foreign_key :user_interest_links, :interests
  end
end
