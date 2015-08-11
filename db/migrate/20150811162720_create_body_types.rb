class CreateBodyTypes < ActiveRecord::Migration
  def change
    create_table :body_types do |t|
      t.string :description, null: false
      t.timestamps null: false
    end

    add_index :body_types, :description, unique: true
  end
end
