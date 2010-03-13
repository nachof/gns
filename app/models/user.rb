class User < ActiveRecord::Base
  has_many :created_events, :class_name => "Event", :foreign_key => :creator_id, :dependent => :destroy
  has_many :invitations, :dependent => :destroy

  devise :authenticatable, :recoverable, :rememberable, :validatable, :registerable

  scope :with_substring, lambda { |str| { :conditions => [ "lower(full_name) like :find or lower(email) like :find", { :find => "%#{str.downcase}%" } ] } }

  def as_json(options = {})
    { :id => id, :name => "#{full_name} &lt;#{email}&gt;" }
  end
end
