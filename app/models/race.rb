class Race < ActiveRecord::Base

	has_and_belongs_to_many :events
	#validates presence: true
	#validates uniqueness: true

end