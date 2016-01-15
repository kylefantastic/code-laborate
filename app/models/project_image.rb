class ProjectImage < ActiveRecord::Base
  mount_uploader :file, ImageUploader
end
