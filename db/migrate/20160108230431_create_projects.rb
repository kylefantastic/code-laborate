class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.boolean :confirmed?, default: false
      t.string :contact_name
      t.string :contact_email
      t.string :contact_phone
      t.date :deadline
      t.integer :developer_id
      t.integer :organization_id


      t.timestamps null: false
    end
  end
end
