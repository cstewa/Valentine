class Photo < ActiveRecord::Base
  attr_accessible :user_id, :name, :picture, :is_profile

  belongs_to :user

  mount_uploader :picture, PhotoUploader
end
