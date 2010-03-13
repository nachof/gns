class Event < ActiveRecord::Base
  belongs_to :creator, :class_name => "User"
  has_many :invitations, :dependent => :destroy
  has_many :invitees, :through => :invitations, :source => :user

  validates :name,     :presence => true
  validates :location, :presence => true
  validates :start_at, :presence => true

  validate :timestamp_validity

  def timestamp_validity
    errors.add(:start_at, "debe ser en el futuro cercano") unless (Time.zone.now..1.year.from_now).include?(start_at)
    errors.add(:end_at,   "debe ser después de la fecha de comienzo") if end_at.present? && end_at <= start_at
  end
  private :timestamp_validity
end
