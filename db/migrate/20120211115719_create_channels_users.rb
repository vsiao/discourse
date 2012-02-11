class CreateChannelsUsers < ActiveRecord::Migration
  def self.up
    create_table :channels_users do |t|
      t.integer :user_id
      t.integer :channel_id

      t.timestamps
    end
  end

  def self.down
    drop_table :channels_users
  end
end
