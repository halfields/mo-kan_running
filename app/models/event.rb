class Event < ActiveRecord::Base

	serialize :races
	belongs_to :organizer
	validates :name, :date, presence: true

end
