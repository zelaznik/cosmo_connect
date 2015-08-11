class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.string :description, null: false

      t.timestamps null: false
    end

    add_index :interests, :description, unique: true
  end
end
