class CreateGalleryAttachments < ActiveRecord::Migration
  def change
    create_table :gallery_attachments do |t|
      t.integer :gallery_id
      t.string :photos

      t.timestamps
    end
  end
end
