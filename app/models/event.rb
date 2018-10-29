class Event < ActiveRecord::Base

	require 'date'

	belongs_to :organizer
	has_and_belongs_to_many :races
	validates :name, :date, presence: true
	validates :name, uniqueness: true

	RACES = %w{fun_run five_k ten_k half_marathon marathon ultra}

	def expired?
		date = Date.strptime(self.date, "%Y%m%d")
		Date.today > date
	end

	def all_races
		RACES
	end

end
