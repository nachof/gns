class CreateUser < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :full_name
      t.authenticatable
      t.rememberable
      t.recoverable
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
