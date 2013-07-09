class Album < ActiveRecord::Base
  attr_accessible :created_at, :desc, :title, :photos_attributes

  has_many :photos, :dependent => :destroy

  accepts_nested_attributes_for :photos, :allow_destroy => true
end
