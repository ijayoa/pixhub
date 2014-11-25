class Photo < ActiveRecord::Base
	# attr_accessible :photo_id,:title,:description,:image
	mount_uploader :image, ImageUploader
end
