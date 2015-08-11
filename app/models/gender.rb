class Gender < ActiveRecord::Base
  has_many :users
  has_many :desired_genders
  has_many :suitors, through: :desired_genders, source: :users
end
