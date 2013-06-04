class Category < ActiveRecord::Base
  attr_accessible :title, :desc
  has_many :products
end
