class DesiredGender < ActiveRecord::Base
  has_many :users
  has_many :genders
end
