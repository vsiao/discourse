class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.integer :uid
      t.integer :school_id

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
