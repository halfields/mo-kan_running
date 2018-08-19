class Event < ActiveRecord::Base

	require 'date'

	serialize :races, Array
	belongs_to :organizer
	validates :name, :date, presence: true

	def expired?
		date = Date.strptime(self.date, "%Y%m%d")
		Date.today > date
	end

end
