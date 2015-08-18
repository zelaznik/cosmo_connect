BodyType.create!([
  {description: "Rather Not Say"},
  {description: "Thin"},
  {description: "Overweight"},
  {description: "Average"},
  {description: "Fit"},
  {description: "Jacked"},
  {description: "A Little Extra"},
  {description: "Curvy"},
  {description: "Full Figured"},
  {description: "Used Up"}
])
DetailsOfUser.create!([
  {user_id: 1, last_online: nil, ethnicity_id: 8, height: nil, body_type_id: 4, relationship_status_id: 1, religion_id: 1, zip_code: nil, latitude: nil, longitude: nil},
  {user_id: 4, last_online: nil, ethnicity_id: 8, height: nil, body_type_id: 5, relationship_status_id: 1, religion_id: 3, zip_code: nil, latitude: nil, longitude: nil},
  {user_id: 6, last_online: nil, ethnicity_id: 8, height: nil, body_type_id: 3, relationship_status_id: 3, religion_id: 4, zip_code: nil, latitude: nil, longitude: nil},
  {user_id: 7, last_online: nil, ethnicity_id: 5, height: nil, body_type_id: 5, relationship_status_id: 1, religion_id: 10, zip_code: nil, latitude: nil, longitude: nil},
  {user_id: 12, last_online: nil, ethnicity_id: nil, height: nil, body_type_id: nil, relationship_status_id: nil, religion_id: nil, zip_code: nil, latitude: nil, longitude: nil},
  {user_id: 14, last_online: nil, ethnicity_id: nil, height: nil, body_type_id: nil, relationship_status_id: nil, religion_id: nil, zip_code: nil, latitude: nil, longitude: nil}
])
Ethnicity.create!([
  {description: "Asian"},
  {description: "Native American"},
  {description: "Hispanic/Latin"},
  {description: "Middle Eastern"},
  {description: "Black"},
  {description: "Indian"},
  {description: "Pacific Islander"},
  {description: "White"},
  {description: "Other"}
])
Gender.create!([
  {name: "man"},
  {name: "woman"},
  {name: "other"}
])
Photo.create!([
  {user_id: 7, description: nil, url: "http://www.google.com", thumb_url: "http://www.npr.org"},
  {user_id: 7, description: nil, url: "http://www.60minutes.com", thumb_url: "http://www.thisamericanlife.org"}
])
RelationshipStatus.create!([
  {description: "Single"},
  {description: "Seeing Someone"},
  {description: "Married"},
  {description: "In An Open Relationship"}
])
Religion.create!([
  {title: "Festivus"},
  {title: "Agnosticism"},
  {title: "Atheism"},
  {title: "Christianity"},
  {title: "Judaism"},
  {title: "Catholocism"},
  {title: "Islam"},
  {title: "Hinduism"},
  {title: "Buddhism"},
  {title: "Other"}
])
Response.create!([
  {response_category_id: 2, user_id: 6, body: nil},
  {response_category_id: 4, user_id: 6, body: nil},
  {response_category_id: 5, user_id: 6, body: nil},
  {response_category_id: 6, user_id: 6, body: nil},
  {response_category_id: 7, user_id: 6, body: nil},
  {response_category_id: 8, user_id: 6, body: nil},
  {response_category_id: 4, user_id: 7, body: "I don't speak english.\r\n  "},
  {response_category_id: 6, user_id: 7, body: "when I'm going to go for a walk."},
  {response_category_id: 7, user_id: 7, body: "cuddling with Lorraine as she tries to do work.\r\n  "},
  {response_category_id: 5, user_id: 1, body: "1,2,3,4,5,6"},
  {response_category_id: 6, user_id: 1, body: "how far behind I am."},
  {response_category_id: 3, user_id: 1, body: "I thought computer programming, but I'm reevaluating."},
  {response_category_id: 1, user_id: 6, body: "Awesome father, uncle, husband, lawyer."},
  {response_category_id: 3, user_id: 6, body: "telling stories."},
  {response_category_id: 4, user_id: 1, body: "power of habit, memento, west wing, deadmau5 I remember, pizza."},
  {response_category_id: 7, user_id: 1, body: "Catching up on my project."},
  {response_category_id: 2, user_id: 7, body: "Cuddling.  Being sweet.  Looking cute.  "},
  {response_category_id: 3, user_id: 7, body: "That sad puppy dog stare.  "},
  {response_category_id: 1, user_id: 7, body: "I'm the easiest dog the Zelazniks have ever had.  "},
  {response_category_id: 8, user_id: 7, body: "You're a black lab or golden retriever.  "},
  {response_category_id: 2, user_id: 1, body: "Attending a coding bootcamp."},
  {response_category_id: 1, user_id: 1, body: "(edit) I don't know what to say."},
  {response_category_id: 5, user_id: 7, body: "tennis balls, tennis, balls, tennis balls.  "},
  {response_category_id: 3, user_id: 4, body: "charming people"},
  {response_category_id: 6, user_id: 4, body: "happy gilmore"},
  {response_category_id: 1, user_id: 4, body: "not sure where I'm going in life, but making lots of friends on the way."},
  {response_category_id: 7, user_id: 4, body: "working"},
  {response_category_id: 8, user_id: 1, body: "(edit) You know CSS and/or bootstrap."},
  {response_category_id: 3, user_id: 14, body: "Stand up comedy."},
  {response_category_id: 6, user_id: 14, body: "how to make clean humor."},
  {response_category_id: 1, user_id: 14, body: "I had the number one TV show."},
  {response_category_id: 7, user_id: 14, body: "Counting my 401k."},
  {response_category_id: 5, user_id: 14, body: "Elaine, Newman"}
])
ResponseCategory.create!([
  {title: "My self-summary"},
  {title: "What I'm doing with my life"},
  {title: "Favorite books, movies, shows, music, and food"},
  {title: "The six things I could never do without"},
  {title: "I spend a lot of time thinkin about"},
  {title: "On a typical Friday night I am"},
  {title: "You should message me if"},
  {title: "I'm really good at."}
])
User.create!([
  {username: "sparticus", password_digest: "$2a$10$LRnclwqRXbDPkp.e1vaHBeyX8wOENzhro5IETV/FC53KMICZkH3Zq", session_token: "3a_kSfDQQXoXB11jC5sPSA", birthdate: "1990-01-01 00:00:00", gender_id: 1, min_age: nil, max_age: nil, max_radius: nil, last_login: nil, last_logout: nil},
  {username: "robert", password_digest: "$2a$10$HbJeVTqbIhlQZ5sYRSmBB.T81AENlKFWsXru0ZLHZA8Brh.HMLsRO", session_token: "ilIvlSLrXf8Ue6-HlHnVOw", birthdate: "1959-01-01 00:00:00", gender_id: 1, min_age: 18, max_age: 92, max_radius: 50, last_login: nil, last_logout: nil},
  {username: "chloe", password_digest: "$2a$10$hcBR4JDKLUvLfZhrq9MU4u4iHE6geGHEsJHIVOgn6FdKpMmvCZGee", session_token: "zBddm3urCZVbCJ1KteQskA", birthdate: "2010-12-01 00:00:00", gender_id: 3, min_age: 18, max_age: 92, max_radius: 50, last_login: nil, last_logout: nil},
  {username: "zelaznik", password_digest: "$2a$10$GxKq.J.9qWJ2tlLU7P6UEerTRa01rIef7GLb9WaXb3FOePHzF/acC", session_token: "mID4TTPfyHyQqF5MHq_q1g", birthdate: "1984-06-02 00:00:00", gender_id: 1, min_age: 18, max_age: 92, max_radius: 50, last_login: nil, last_logout: nil},
  {username: "seinfeld", password_digest: "$2a$10$WO0BighJXm2znlGFT0XxWuC/RYPtvVFfOHN.7o5.aeFb9StkJUwxe", session_token: "uuSF9LBG1ETMuoM3C1Crwg", birthdate: "1954-04-29 00:00:00", gender_id: 1, min_age: nil, max_age: nil, max_radius: nil, last_login: nil, last_logout: nil},
  {username: "michael", password_digest: "$2a$10$L5KCtJ632ssljfS/qTaFBOtcIVowGo6aSb1XwCobV3yvjYepJNWwy", session_token: "iDVLqQ3gaSSOsYLeBE7W2g", birthdate: "1985-07-14 00:00:00", gender_id: 1, min_age: 18, max_age: 92, max_radius: 50, last_login: nil, last_logout: nil}
])
