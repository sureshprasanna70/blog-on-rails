class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :caption

      t.timestamps
    end
  end
end
