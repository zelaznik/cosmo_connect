class Response < ActiveRecord::Base
  belongs_to :response_category
  belongs_to :user
end
