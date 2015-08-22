class Match < ActiveRecord::Base
  belongs_to :sender, class_name: "User", foreign_key: :sender_id
  belongs_to :receiver, class_name: "User", foreign_key: :receiver_id

  has_many(
    :mutual_matches,
    class_name: "Match",
    foreign_key: :sender_id,
    primary_key: :receiver_id
  )

  has_many(
    :mutual_users,
    class_name: "User",
    through: :mutual_matches,
    source: :sender
  )

end
