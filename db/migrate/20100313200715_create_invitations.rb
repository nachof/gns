class CreateInvitations < ActiveRecord::Migration
  def self.up
    create_table :invitations do |t|
      t.integer :user_id
      t.integer :event_id
      t.string :state

      t.timestamps
    end
  end

  def self.down
    drop_table :invitations
  end
end
