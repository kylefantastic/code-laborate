class Category < ActiveRecord::Base
  has_many :category_projects
  has_many :projects, through: :category_projects
end
