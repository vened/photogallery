class Product < ActiveRecord::Base
  attr_accessible :desc, :metadesc, :metakey, :price, :title, :weight, :attachments_attributes, :category_id, :path

  has_many :attachments, :dependent => :destroy

  validates :title, :length => {:minimum => 1}
  validates :path,
            :uniqueness => true
  #:format => {:with => /\A[a-zA-Zа-яА-Я0-9\-]+\z/, :message => "Допускается только латиница и/или цифры"}


  def to_param
    "#{path}"
  end

  belongs_to :category

  accepts_nested_attributes_for :attachments, :allow_destroy => true
end
