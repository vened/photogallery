class Category < ActiveRecord::Base
  attr_accessible :title, :description, :path, :total, :sortable
  has_many :products

  validates :title, :length => {:minimum => 1}
  validates :path,
            :uniqueness => true,
            :length => {:minimum => 1}


  def to_param
    "#{path}"
  end

end
