class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :street_address
      t.string :unit
      t.string :phone_number
      t.string :city
      t.string :country
      t.string :state
      t.string :zip_code

      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
