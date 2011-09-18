class MenuItem < ActiveRecord::Base
  #belongs_to(:menu_id)
  
  validate :menu_id, :presense => true
  validate :price, :presense => true
  validate :name, :presense => true
end
