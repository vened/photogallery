class Product < ActiveRecord::Base
  attr_accessible :desc, :metadesc, :metakey, :old_price, :price, :title, :weight
end
