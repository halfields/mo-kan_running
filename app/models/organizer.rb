class Organizer < ActiveRecord::Base

	has_many :events

	validates :name, :email, :password, presence: true
end
