class TextPage < ActiveRecord::Base
  attr_accessible :desc, :meta_desc, :meta_key, :title, :page_id

  belongs_to :page

end
