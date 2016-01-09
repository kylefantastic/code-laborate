class User < ActiveRecord::Base
  has_one :current_project, class_name: "Project", foreign_key: :developer_id
  belongs_to :organization
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
