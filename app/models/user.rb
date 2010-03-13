class User < ActiveRecord::Base
  has_many :created_events, :class_name => "Event", :foreign_key => :creator_id, :dependent => :destroy

  devise :authenticatable, :recoverable, :rememberable, :validatable, :registerable
end
