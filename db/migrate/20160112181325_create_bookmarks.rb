class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.integer :project_id
      t.integer :developer_id
      t.timestamps null: false
    end
  end
end
