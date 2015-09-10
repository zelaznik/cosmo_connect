class DefaultPreference < ActiveRecord::Base
  belongs_to :gender
  belongs_to :desire, class_name: "Gender"
end
