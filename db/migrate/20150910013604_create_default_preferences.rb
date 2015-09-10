class CreateDefaultPreferences < ActiveRecord::Migration
  def up
    create_table :default_preferences do |t|
      t.integer :gender_id, null: false
      t.integer :desire_id, null: false
      t.timestamps null: false
    end

    add_index :default_preferences, :gender_id, unique: true
    add_foreign_key :default_preferences, :genders
    add_foreign_key :default_preferences, :genders, column: :desire_id

    man = Gender.find_by_name('man')
    woman = Gender.find_by_name('woman')
    other = Gender.find_by_name('other gender')
    dog = Gender.find_by_name('dog')

    DefaultPreference.new(gender: man, desire: woman).save!
    DefaultPreference.new(gender: woman, desire: man).save!
    DefaultPreference.new(gender: other, desire: other).save!
    DefaultPreference.new(gender: dog, desire: dog).save!
  end

  def down
    drop_table :default_preferences
  end

end
