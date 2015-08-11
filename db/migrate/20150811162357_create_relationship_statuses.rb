class CreateRelationshipStatuses < ActiveRecord::Migration
  def change
    create_table :relationship_statuses do |t|
      t.string :description, null: false
      t.timestamps null: false
    end

    add_index :relationship_statuses, :description, unique: true
  end
end
