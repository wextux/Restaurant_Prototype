class CreateMenus < ActiveRecord::Migration
  def self.up
    create_table :menus do |t|
      t.integer :restaurant_id,   :null => false
      t.string :menu_type,        :null => false
      t.string :name,             :null => false
      t.boolean :is_visible,      :default => true
      t.text :description
      
      t.timestamps
    end
  end

  def self.down
    drop_table :menus
  end
end
