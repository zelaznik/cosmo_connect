class CreateReligions < ActiveRecord::Migration
  def change
    create_table :religions do |t|
      t.string :title, null: false

      t.timestamps null: false
    end

    add_index :religions, :title, unique: true
  end
end
