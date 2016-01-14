class Project < ActiveRecord::Base
  validates :title, :vision, :need, :benefit, :description, :contact_name, :contact_email, :contact_phone, :organization_id, :presence => true
  validates :title, :description, :uniqueness => true
  # validate :validatePhoneNumber, on: :create
  belongs_to :organization
  belongs_to :developer, class_name: "User"
  has_one :org_admin, through: :organization
  has_many :bookmarks
  has_many :interested_developers, through: :bookmarks, source: :developer
  has_many :category_projects
  has_many :categories, through: :category_projects

  # Paperclip
  has_attached_file :project_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :project_image, content_type: /\Aimage\/.*\Z/
  # Not sure if this will break everything
  # validates_with AttachmentSizeValidator, attributes: :project_image, less_than: 1.megabytes

  def self.search(query)
    where("description like ? or title like ?" , "%#{query}%", "%#{query}%")
  end

  def validatePhoneNumber
    errors.add(:contact_phone, "Please enter a valid 10 digit phone number") unless
      /\W*([2-9][0-8][0-9])\W*([2-9][0-9]{2})\W*([0-9]{4})(\se?x?t?(\d*))?/ =~ self.contact_phone
  end

  # def project_notification(record)
  #   @record = record
  #    mail to: "danyell85@gmail.com", subject: "You project got selected."
  # end

end
