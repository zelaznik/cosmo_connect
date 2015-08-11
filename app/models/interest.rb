class Interest < ActiveRecord::Base
  has_many :user_interest_links
  has_many :users, through: :user_interest_links, source: :user
end
