class CreateEthnicities < ActiveRecord::Migration
  def change
    create_table :ethnicities do |t|
      t.string :description, null: false
      t.timestamps null: false
    end

    add_index :ethnicities, :description, unique: true
  end
end
