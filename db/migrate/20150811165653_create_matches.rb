class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :sender_id, null: false
      t.integer :receiver_id, null: false

      t.timestamps null: false
    end

    add_index :matches, :sender_id
    add_index :matches, :receiver_id
    add_index :matches, [:sender_id, :receiver_id], unique: true

    add_foreign_key :matches, :users, column: :sender_id
    add_foreign_key :matches, :users, column: :receiver_id
  end
end
