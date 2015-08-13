class DetailsOfUser < ActiveRecord::Base
  belongs_to :user

  belongs_to :ethnicity
  belongs_to :body_type
  belongs_to :religion
  belongs_to :relationship_status

  validates :user, presence: true

end
