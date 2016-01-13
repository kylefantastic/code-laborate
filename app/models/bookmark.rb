class Bookmark < ActiveRecord::Base
  belongs_to :project
  belongs_to :developer, class_name: "User"
end
