class GalleryAttachment < ActiveRecord::Base
   mount_uploader :photos, PhotosUploader
   belongs_to :gallery
end
