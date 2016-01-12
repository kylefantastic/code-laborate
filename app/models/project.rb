class Project < ActiveRecord::Base
  validates :title, :vision, :need, :benefit, :description, :contact_name, :contact_email, :contact_phone, :organization_id, :presence => true
  validates :title, :description, :uniqueness => true
  belongs_to :organization
  belongs_to :developer, class_name: "User"
  has_one :org_admin, through: :organization

<<<<<<< HEAD
=======

  def self.search(query)
    where("description like ? or title like ?" , "%#{query}%", "%#{query}%")
  end

>>>>>>> f3cf1d3647c009ca69fd18cd10132a92556a2e5f
  # def project_notification(record)
  #   @record = record
  #    mail to: "danyell85@gmail.com", subject: "You project got selected."
  # end
<<<<<<< HEAD
=======

>>>>>>> f3cf1d3647c009ca69fd18cd10132a92556a2e5f
end
