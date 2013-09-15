class Photo < ActiveRecord::Base
  attr_accessible :file, :album_id

  mount_uploader :file, PhotoUploader

  validates :file, :presence => true

  belongs_to :album
  belongs_to :news

end
