class CreateGenders < ActiveRecord::Migration
  def change
    create_table :genders do |t|
      t.string :name, null: false
      t.timestamps null: false
    end

    add_index :genders, :name, unique: true
  end
end
