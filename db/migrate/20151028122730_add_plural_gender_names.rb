class AddPluralGenderNames < ActiveRecord::Migration
  def up
    add_column :genders, :plural, :string
    add_index :genders, :plural, unique: true

    Gender.all.each do |g|
      g.plural = g.name.pluralize
      g.save!
    end

    change_column :genders, :plural, :string, null: false
  end

  def down
    remove_column :genders, :plural
  end
end
