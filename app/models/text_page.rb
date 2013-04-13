class TextPage < ActiveRecord::Base
  attr_accessible :desc, :meta_desc, :meta_key, :title

  belongs_to :page

end
