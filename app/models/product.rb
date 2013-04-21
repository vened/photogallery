class Product < ActiveRecord::Base
  attr_accessible :desc, :metadesc, :metakey, :price, :title, :weight, :attachments_attributes

  has_many :attachments, :dependent => :destroy

  accepts_nested_attributes_for :attachments, :allow_destroy => true
end
