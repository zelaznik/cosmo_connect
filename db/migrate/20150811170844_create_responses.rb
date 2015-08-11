class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :response_category_id, null: false
      t.integer :user_id, null: false
      t.text :body

      t.timestamps null: false
    end

    add_index :responses, :user_id
    add_index :responses, :response_category_id
    add_index :responses, [:user_id, :response_category_id], unique: true

    add_foreign_key :responses, :response_categories
    add_foreign_key :responses, :users
  end
end
