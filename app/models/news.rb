# encoding: utf-8
class News < ActiveRecord::Base
  attr_accessible :title, :desc, :meta_key, :meta_desc, :photos_attributes

  validates :title, :length => {:minimum => 1}
  validates :desc, :length => {:minimum => 10}

  has_many :photos, :dependent => :destroy

  accepts_nested_attributes_for :photos, :allow_destroy => true

end
