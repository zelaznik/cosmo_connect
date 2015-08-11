class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :visitor_id, null: false
      t.integer :profile_id, null: false

      t.timestamps null: false
    end

    add_index :visits, :visitor_id
    add_index :visits, :profile_id
    add_index :visits, [:visitor_id, :profile_id], unique: true

    add_foreign_key :visits, :users, column: :visitor_id
    add_foreign_key :visits, :users, column: :profile_id
  end
end
