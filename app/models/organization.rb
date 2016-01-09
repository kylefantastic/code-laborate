class Organization < ActiveRecord::Base
  validates :name, :website_url, :description, :presence => true
  validates :name, :website_url, :uniqueness => true
  has_one :org_admin, class_name: "User", foreign_key: :organization_id
  has_many :projects
end
