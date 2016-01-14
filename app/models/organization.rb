class Organization < ActiveRecord::Base
  validates :name, :website_url, :description, :presence => true
  validates :name, :website_url, :uniqueness => true
  has_one :org_admin, class_name: "User", foreign_key: :organization_id
  has_many :projects, dependent: :destroy

  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

  def self.search(query)
    where("name like ?", "%#{query}%")
  end
end
