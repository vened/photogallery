class Photo < ActiveRecord::Base
  attr_accessible :file

  mount_uploader :file, PhotoUploader

  belongs_to :album

end
