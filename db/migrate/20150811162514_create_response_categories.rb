class CreateResponseCategories < ActiveRecord::Migration
  def change
    create_table :response_categories do |t|
      t.string :title, null: false

      t.timestamps null: false
    end

    add_index :response_categories, :title, unique: true
  end
end
