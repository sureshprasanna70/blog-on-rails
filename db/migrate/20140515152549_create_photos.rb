class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.text :image_title

      t.timestamps
    end
  end
end
