class DesiredGender < ActiveRecord::Base
  belongs_to :user
  belongs_to :gender
end
