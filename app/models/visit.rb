class Visit < ActiveRecord::Base
  belongs_to :visitor, class_name: "User", foreign_key: :visitor_id
  belongs_to :profile, class_name: "User", foreign_key: :profile_id
  
end
