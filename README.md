# Cosmo-connect

[Live Link][heroku]
[heroku]: http://www.cosmo-connect.com

[profile_jerry]: https://github.com/zelaznik/cosmo_connect/blob/master/_readme/jerry_profile.jpg
![Thumbnail Preview Of Jerry Seinfeld's Profile][profile_jerry]


## Overview
Cosmo-connect is a dating website parody built in the spirit of OkCupid.  The website is seeded with profiles from the sitcom "Seinfeld."  Users can browse other profiles within their selected ages and geography.  The profile is a mixture of essay categories, selecting interests, and uploading photos.  Users can message each other.  Users can also match with other users.  In the style of Tinder, the other person will only see if you like them after they like you back.

## Technologies Used
[technologies]: https://github.com/zelaznik/cosmo_connect/blob/master/_readme/technologies.jpg
![Ruby Rails Bootstrap CSS3 Javascript Backbone jQuery PostgreSQL][technologies]

##  Database Design
A screenshot of the table structure can be found [here] [schema1].  The database design follows best practices where every unique piece of data is atomic and only in one place.

[schema1]: ./_readme/cosmo_schema.gif

#### Fully Normalized Data

The database is normalized and designed to be scalable.  All the multiple choice questions such as religion, ethnicity, and body type, are stored in separate tables.  The users' choices are stored as integers.  Adding another option for the users is as simple as adding a record in the database.  The dropdown menus in the browser automatically update.  Such as here:

[start_game]: https://raw.githubusercontent.com/zelaznik/cosmo_connect/master/_readme/drop_down_tables.gif
![Tables For Dropdown Menus][start_game]

#### Consistent Data Through Triggers

Each user has a set of short essay questions they can answer.  These responses follow a many-to-many relationship: many users, many essay categories.  When a user sets up an account, he/she must see those categories even if no answers have been filled in yet.  If such a record doesn't exist yet, the problem is that Backbone JS doesn't work well with LEFT JOINS.  When the record doesn't have a unique id yet, refreshing the page can create duplicate views.  The problem is solved with a few simple lines of the Postgres procedural language, plpgsql.

```sql
CREATE FUNCTION _trg_aft_ins_users()
RETURNS TRIGGER AS $$
  BEGIN
    INSERT INTO responses (
    response_category_id, user_id, created_at, updated_at)
    SELECT id, NEW.id, NEW.updated_at, NEW.updated_at
    FROM response_categories;
    RETURN NULL;
  END
$$ LANGUAGE 'plpgsql';

CREATE TRIGGER trg_aft_ins_users AFTER INSERT ON users
FOR EACH ROW EXECUTE PROCEDURE _trg_aft_ins_users();
```

Every time a new user is created, a set of blank essay responses are automatically populated.  A corresponding trigger exists: whenever an administrator of the site creates a new essay category, a trigger is called to create a blank record for each existing user.  Other triggers exist, such as those that create a set of sexual preferences with each new user, all set to False.  More about that in section further down the page.

#### Scalable Gender Identities and Preferences
Over the last year, the real OkCupid has introduced [new choices for gender identities and sexual preferences](http://www.huffingtonpost.com/2014/11/17/okcupid-new-gender-options_n_6172434.html) that extend beyond the binary male/female.  From a data architect's perspective this could be a nightmare.  Adding a new field for each possible gender is unwieldy.  In Cosmo-Connect the structure is normalized so this isn't a problem.  Gender options are in a table.  A user chooses one gender and only one from a list.  Then to indicate orientation, users check the boxes "interested_in" for one or multiple genders.

This makes the database scalable as dating websites increasingly cater to clients' more nuanced gender identities and sexual orientations.  The following query is run to return all users who are at least theoretically compatible by gender and orientation.

[matches_by_orientation_query]: https://raw.githubusercontent.com/zelaznik/cosmo_connect/master/_readme/matches_by_orientation_query.gif
![Matches By Orientation Visual Query][matches_by_orientation_query]

```sql
SELECT
  them.id
FROM
  users me
INNER JOIN
  desired_genders my_preferences ON my_preferences.user_id = me.id
INNER JOIN
  desired_genders their_preferences ON their_preferences.gender_id = me.gender_id
INNER JOIN
  users them
  ON my_preferences.gender_id = them.gender_id
  AND their_preferences.user_id = them.id
WHERE
  me.id = $1
  AND my_preferences.interested
  AND their_preferences.interested
```

Due to time constraints and the range of Seinfeld characters, the database only includes choices "male/female/other" at the moment, but expanding those choices is only an INSERT query away.

#### Subqueries: The Compromise Between ActiveRecord and pure SQL
ActiveRecord offers great convenience, but it comes at a cost.  To do the following query with pure ActiveRecord relations, it would be a mess.  We would need to daisy chain a bunch of intermediate "through" associations which would never be used for anything else.  It would be difficult to debug and it would pollute the namespace of the user model.  At the same time, writing straight SQL queries with a "find_by_sql" means we lose all the nice properties of ActiveRecord such as the option to include other tables later on, avoiding N+1 queries.

This solution is a compromise, but effective.  Write whatever query you want, returning only the id's of the ActiveRecord model in question.  Insert that query as a subquery into a where method of your ActiveRecord Model.

```ruby
class User < ActiveRecord::Base
  def soulmates
    # Use a subquery to get the unique ids of the soulmates
    # Then put it into a plain old ActiveRecord associaton
    User.where("id IN (
      SELECT
        them.id
      FROM
        users you
      INNER JOIN
        matches m0 ON m0.sender_id = you.id
      INNER JOIN
        matches m1 ON m1.sender_id = m0.receiver_id
        AND m1.receiver_id = #{self.id}
      INNER JOIN
        users them ON m1.sender_id = them.id
      WHERE
        you.id = #{self.id}
    )")
  end
end
```

Yes, it is an additional query, but it's still only a single round trip to the Postgres database.  Now we maintain all the nice properties of ActiveRecord such as the ability to choose to include other tables at a later time.

#### Redundant Validations At Both Rails and Postgres Levels

Finally, my experience has taught me that the data structure generally outlives the code for which it was created.  Rails provides the ability to validate data at the model level, but should we switch platforms, we want the database to be more than an assorted collection of tables.

For this reason, foreign key constraints, unique constraints, and such are all validated twice.  Normally the rails model catches the error first and returns a useful message to the user.  But in the case of a coding bug, a 500 level error from the database is still not as bad as corrupted data.
