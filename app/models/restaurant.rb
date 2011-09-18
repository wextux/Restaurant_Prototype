class Restaurant < ActiveRecord::Base
  has_many :addesses
  has_many :menus
  #belongs_to(:user_id)
  
  validate :user_id, :presence => true
  validate :name, :presence => true,
                  :length => { :maximum => 50}
  
end
