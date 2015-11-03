# Cosmo-connect

[Heroku link][heroku]
[heroku]: http://www.cosmo-connect.com

## Elevator-pitch
Cosmo-connect is a clone of OkCupid built on Rails, PostgreSQL, and Backbone.  The site is seeded with profiles from the sitcom "Seinfeld."

## Minimnum Viable Product
Users can browse other profiles within their selected ages and geography.  The profile is a mixture of essay categories, selecting interests, and uploading photos.  Users can message each other.  Users can also match with other users.  In the style of Tinder, the other person will only see if you like them after they like you back.

##  Database Design
* [DB schema (part1)] [schema1]
* [DB schema (part2)] [schema2]

[schema1]: ./schema/schema_1of2_312kb.jpg
[schema2]: ./schema/schema_2of2_312kb.jpg

## Front End Layouts
* [Misc Views] [misc_views]
* [Chats Template] [chats_template]
* [Messages Template] [messages_template]
* [Visitors Template] [visitors_template]
* [Likes Template] [likes_template]

[misc_views]: ./layouts/misc_views.jpg
[chats_template]: ./layouts/chats_template.jpg
[messages_template]: ./layouts/messages_templates.jpg
[visitors_template]: ./layouts/visitors_template.jpg
[likes_template]: ./layouts/likes_template.jpg

## Skeleton Blueprint
- Session Skeleton
  - [X] ~~Create accounts~~
  - [X] ~~Create sessions (log in)~~
  - [X] ~~store whether the user is currently logged in~~
  - [ ] store the last time they logged out.

- Make different features based on whether the profile is regular or guest
  - These features are available even to those who don't create an account:
    - [ ] select age range of users.
    - [ ] search for other users within a geographical range.
    - [ ] select one or more genders the user is interested in
    - [ ] Create a parallel criteria set for what the user should be looking for.
      - For example: Looking for women between ages 23-31 who are interested in men between ages 25 and 35.

  - Here are features for people who create accounts, including guest ones.
    - Create a guide for user to create new profile.
      - [ ] Date of Birth
      - [ ] Location
      - [ ] Select from list of genders (Male, Female, Other)
        - [ ] Select one or more genders you're interested in.
      - [ ] Select one or more hobbies you're interested in.
        - [ ] Create your own hobby.
      - [ ] Upload photos.
        - [ ] Add a description field for each photo.
        - [ ] Change the order in which photos appear.  The first one is your profile shot.

  - Features solely for guest users.
    - [ ] Add a random number generator so that fake profiles will like a guest user back randomly.

- Implementation on the back end.
    - [ ] create a procedure to convert a zip code into latitude and longitude.
    - [ ] write function in PostgreSQL to filter the square into a circle.
  - [ ] select one or more genders they are interested in
  - [ ] select a number of interests

## Draft Timeline (Week1)

- Day 1
  - [X] ~~Create DB Migrations~~
  - [X] ~~Create ActiveRecord Associations~~
  - [X] ~~Seed the database with some profiles~~
- Day 1 Bonus?
  - [X] ~~Test active record associations.~~

- Day 2
  - [X] ~~Get Menu Bar working in Bootstrap~~
  - [ ] (Learn Bootstrap)

- Day 3
  - Get other views to work
    - [X] ~~User View~~
    - [ ] Message Preview View
    - [ ] Chat Header View

- Day 4
  - More backend queries.
    - [ ] Search for Users within certain radius.
    - [ ] Received Messages
    - [ ] Sent Messages
    - [ ] Full Chats w/ Users
    - [ ] Percent Match: Normalized Hamming Distance
    - [ ] Percent Enemy: 1 - Percent Match

- Weekend
  - [ ] Regroup.  Write a project plan for the following week.
  - [ ] Grieve.



<!-- The rest of this template is stolen from a sapmle proposal.
## Implementation Timeline

### Phase 1: User Authentication, Blog Creation (~1 day)
I will implement user authentication in Rails based on the practices learned at
App Academy. By the end of this phase, users will be able to create blogs using
a simple text form in a Rails view. The most important part of this phase will
be pushing the app to Heroku and ensuring that everything works before moving on
to phase 2.

[Details][phase-one]

### Phase 2: Viewing Blogs and Posts (~2 days)
I will add API routes to serve blog and post data as JSON, then add Backbone
models and collections that fetch data from those routes. By the end of this
phase, users will be able to create blogs and view both blogs and posts, all
inside a single Backbone app.

[Details][phase-two]

### Phase 3: Editing and Displaying Posts (~2 days)
I plan to use third-party libraries to add functionality to the `PostForm` and
`PostShow` views in this phase. First I'll need to add a Markdown editor to the
`PostForm`, and make sure that the Markdown is properly escaped and formatted in
the `PostShow` view. I also plan to integrate Filepicker for file upload so
users can add images to blog posts.

[Details][phase-three]

### Phase 4: User Feeds (~1-2 days)
I'll start by adding a `feed` route that uses the `current_user`'s
`subscribed_blogs` association to serve a list of blog posts ordered
chronologically. On the Backbone side, I'll make a `FeedShow` view whose `posts`
collection fetches from the new route.  Ultimately, this will be the page users
see after logging in.

[Details][phase-four]

### Phase 5: Searching for Blogs and Posts (~2 days)
I'll need to add `search` routes to both the Blogs and Posts controllers. On the
Backbone side, there will be a `SearchResults` composite view has `BlogsIndex`
and `PostsIndex` subviews. These views will use plain old `blogs` and `posts`
collections, but they will fetch from the new `search` routes.

[Details][phase-five]

### Bonus Features (TBD)
- [ ] "Like" button and counter for posts
- [ ] Custom blog urls
- [ ] Pagination/infinite scroll
- [ ] Activity history (e.g. likes, reblogs, taggings)
- [ ] Post types (image posts, quote posts, etc)
- [ ] Reblogging
- [ ] Multiple sessions/session management
- [ ] User avatars
- [ ] Typeahead search bar

[phase-one]: ./docs/phases/phase1.md
[phase-two]: ./docs/phases/phase2.md
[phase-three]: ./docs/phases/phase3.md
[phase-four]: ./docs/phases/phase4.md
[phase-five]: ./docs/phases/phase5.md

-->
