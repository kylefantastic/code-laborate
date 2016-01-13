class AddAttachmentProjectImageToProjects < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.attachment :project_image
    end
  end

  def self.down
    remove_attachment :projects, :project_image
  end
end
