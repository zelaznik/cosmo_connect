# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Add all the genders
Gender.new({id: 1, name: 'man'}).save!
Gender.new({id: 2, name: 'woman'}).save!
Gender.new({id: 3, name: 'other'}).save!

# Add all the ethnicities
Ethnicity.new({description: 'Asian'}).save!
Ethnicity.new({description: 'Native American'}).save!
Ethnicity.new({description: 'Hispanic/Latin'}).save!
Ethnicity.new({description: 'Middle Eastern'}).save!
Ethnicity.new({description: 'Black'}).save!
Ethnicity.new({description: 'Indian'}).save!
Ethnicity.new({description: 'Pacific Islander'}).save!
Ethnicity.new({description: 'White'}).save!
Ethnicity.new({description: 'Other'}).save!

# Add all body types
BodyType.new({description: 'Rather Not Say'}).save!
BodyType.new({description: 'Thin'}).save!
BodyType.new({description: 'Overweight'}).save!
BodyType.new({description: 'Average'}).save!
BodyType.new({description: 'Fit'}).save!
BodyType.new({description: 'Jacked'}).save!
BodyType.new({description: 'A Little Extra'}).save!
BodyType.new({description: 'Curvy'}).save!
BodyType.new({description: 'Full Figured'}).save!
BodyType.new({description: 'Used Up'}).save!

# Add all religions
Religion.new({title: 'Festivus'}).save!
Religion.new({title: 'Agnosticism'}).save!
Religion.new({title: 'Atheism'}).save!
Religion.new({title: 'Christianity'}).save!
Religion.new({title: 'Judaism'}).save!
Religion.new({title: 'Catholocism'}).save!
Religion.new({title: 'Islam'}).save!
Religion.new({title: 'Hinduism'}).save!
Religion.new({title: 'Buddhism'}).save!
Religion.new({title: 'Other'}).save!

RelationshipStatus.new({description: 'Single'}).save!
RelationshipStatus.new({description: 'Seeing Someone'}).save!
RelationshipStatus.new({description: 'Married'}).save!
RelationshipStatus.new({description: 'In An Open Relationship'}).save!

ResponseCategory.new({id: 1, title: 'My self-summary'}).save!
ResponseCategory.new({id: 2, title: "What I'm doing with my life"}).save!
ResponseCategory.new({id: 3, title: "I'm really goot at"}).save!
ResponseCategory.new({id: 4, title: "Favorite books, movies, shows, music, and food"}).save!
ResponseCategory.new({id: 5, title: "The six things I could never do without"}).save!
ResponseCategory.new({id: 6, title: "I spend a lot of time thinkin about"}).save!
ResponseCategory.new({id: 7, title: "On a typical Friday night I am"}).save!
ResponseCategory.new({id: 8, title: "You should message me if"}).save!
