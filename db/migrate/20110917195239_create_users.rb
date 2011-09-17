class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :company,            :null => false
      t.string :email,              :null => false
      t.string :encrypted_password, :null => false
      t.string :salt,               :null => false
      t.date   :date_joined,        :null => false
      
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
