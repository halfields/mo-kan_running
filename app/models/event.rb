class Event < ActiveRecord::Base

	serialize :races, Array
	belongs_to :organizer
	validates :name, :date, presence: true

end
