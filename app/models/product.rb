class Product < ActiveRecord::Base
  attr_accessible :desc, :metadesc, :metakey, :price, :title, :weight, :attachments_attributes, :category_id

  has_many :attachments, :dependent => :destroy

  belongs_to :category

  accepts_nested_attributes_for :attachments, :allow_destroy => true
end
