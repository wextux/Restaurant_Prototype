class CreateMenuItems < ActiveRecord::Migration
  def self.up
    create_table :menu_items do |t|
      t.string :type,       :null => false
      t.string :name,       :null => false
      t.float :price,       :null => false
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :menu_items
  end
end
