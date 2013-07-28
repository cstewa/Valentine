class Photo < ActiveRecord::Base
  attr_accessible :album_id, :name, :picture

  belongs_to :user

  mount_uploader :picture, ImageUploader
end
