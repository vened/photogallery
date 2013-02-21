class Page < ActiveRecord::Base
  acts_as_nested_set
  attr_accessible :title, :path, :parent_id
end
