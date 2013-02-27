class Page < ActiveRecord::Base
  acts_as_nested_set
  attr_accessible :title, :path, :parent_id

  def parent_path
    self_and_ancestors.pluck(:path).join("/")
  end


  def to_param
    "#{parent_path}"
  end

  validates :path, :uniqueness => true

end
