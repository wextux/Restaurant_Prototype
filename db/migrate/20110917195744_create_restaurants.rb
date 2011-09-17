class CreateRestaurants < ActiveRecord::Migration
  def self.up
    create_table :restaurants do |t|
      t.integer :user_id,   :null => false
      t.string :name,       :null => false
      t.text :description
      
      t.timestamps
    end
  end

  def self.down
    drop_table :restaurants
  end
end
