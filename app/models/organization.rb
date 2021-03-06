class Organization < ActiveRecord::Base

  # Removed validations for website_url
  validates :name, :description, :presence => true
  validates :name, :uniqueness => true

  has_one :org_admin, class_name: "User", foreign_key: :organization_id
  has_many :projects, dependent: :destroy

  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.jpg"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/
  # Not sure if this will break everything
  # validates_with AttachmentSizeValidator, attributes: :logo, less_than: 1.megabytes

  def self.search(query)
    where("name like ?", "%#{query}%")
  end
end
