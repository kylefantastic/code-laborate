class Project < ActiveRecord::Base
  belongs_to :organization
  belongs_to :developer, class_name: "User"
  has_one :org_admin, through: :organization
end
