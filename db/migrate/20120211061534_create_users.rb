class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :uid
      t.integer :school_id
      t.integer :authentication_id
      t.integer :channel_id

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
