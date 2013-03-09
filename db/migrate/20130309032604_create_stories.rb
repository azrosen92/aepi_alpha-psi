class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.string :body
      t.string :image_path

      t.timestamps
    end
  end
end
