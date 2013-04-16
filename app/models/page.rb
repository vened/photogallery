# encoding: utf-8
class Page < ActiveRecord::Base
  acts_as_nested_set
  attr_accessible :title, :meta_key, :meta_desc, :path, :parent_id, :include_text_page


  validates :title, :length => {:minimum => 1}
  validates :path,
            :uniqueness => true,
            :length => {:minimum => 1},
            :format => {:with => /\A[a-zA-Z0-9]+\z/, :message => "Допускается только латиница и/или цифры"}

  has_many :text_pages, :dependent => :destroy

  include TheSortableTree::Scopes

  def parent_path
    self_and_ancestors.pluck(:path).join("/")
  end

  def to_param
    "#{parent_path}"
  end

end
