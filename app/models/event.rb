class Event < ActiveRecord::Base

	belongs_to :organizer

	validates :name, :date, presence: true

end
