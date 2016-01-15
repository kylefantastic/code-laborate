class CreateCategoryProjects < ActiveRecord::Migration
  def change
    create_table :category_projects do |t|
      t.integer :project_id
      t.integer :category_id
      t.timestamps null: false
    end
  end
end
