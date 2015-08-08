class Event < ActiveRecord::Base
  belongs_to :creator, :class_name => "User"
  has_many :invites, :foreign_key => "attended_event_id"
  has_many :attendees, :through => :invites
  scope :past, -> { where("date < ?", Date.today)}
  scope :upcoming, -> { where("date >= ?", Date.today )}
  validates :title, presence: true
  validates :date, presence: true
  validates :body, presence: true
  
  
 
end
