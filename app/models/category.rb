class Category < ActiveRecord::Base
  attr_accessible :title, :description, :path
  has_many :products

  def to_param
    "#{path}"
  end

end
