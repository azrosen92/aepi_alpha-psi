class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.string :story
      t.string :image_path

      t.timestamps
    end
  end
end
