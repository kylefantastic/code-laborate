class Project < ActiveRecord::Base
  validates :title, :vision, :need,:benefit, :description, :contact_name, :contact_email, :contact_phone, :organization_id, :presence => true
  validates :title, :description, :uniqueness => true
  belongs_to :organization
  belongs_to :developer, class_name: "User"
  has_one :org_admin, through: :organization
end
