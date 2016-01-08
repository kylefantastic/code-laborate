class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :developer_id
      t.integer :organization_id

      t.timestamps null: false
    end
  end
end
