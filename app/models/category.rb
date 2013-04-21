class Category < ActiveRecord::Base
  attr_accessible :title, :desc
  has_many :products
  
  belongs_to :category
  has_many :categories
end
