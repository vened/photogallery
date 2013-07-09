class Album < ActiveRecord::Base
  attr_accessible :desc, :title, :photos_attributes, :created_at

  has_many :photos, :dependent => :destroy

  validates_associated :photos

  accepts_nested_attributes_for :photos, :allow_destroy => true
end
