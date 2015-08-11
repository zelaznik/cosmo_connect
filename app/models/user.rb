class User < ActiveRecord::Base
  belongs_to :gender
  has_many :desired_genders
  has_many :genders_sought, through: :desired_genders, source: :gender
  has_many :users_of_desirable_gender, through: :desired_genders, source: :user

  has_many :visits, foreign_key: :visitor_id
  has_many :visited_profiles, through: :visits, source: :profile
  has_many :visitors, through: :visits, source: :visitor

end
