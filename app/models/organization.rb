class Organization < ActiveRecord::Base
  has_one :org_admin, class_name: "User", foreign_key: :organization_id
  has_many :projects
end
