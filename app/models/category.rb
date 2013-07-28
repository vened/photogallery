class Category < ActiveRecord::Base
  attr_accessible :title, :description, :path, :total, :sortable, :sortable_old
  attr_accessor :sortable_old
  has_many :products

  validates :title, :length => {:minimum => 1}
  validates :path,
            :uniqueness => true,
            :length => {:minimum => 1}


  def to_param
    "#{path}"
  end

end
