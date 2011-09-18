class Menu < ActiveRecord::Base
  has_many(:menu_items)
  #belongs_to(:restaurant_id)
  
  validate :restaurant_id, :presense => true
  validate :type, :presense => true
  validate :name, :presense => true
  
end
