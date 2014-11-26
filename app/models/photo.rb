class Photo < ActiveRecord::Base
	belongs_to :user
	# attr_accessible :photo_id,:title,:description,:image
	mount_uploader :image, ImageUploader
end
