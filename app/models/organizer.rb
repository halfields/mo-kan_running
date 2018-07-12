class Organizer < ActiveRecord::Base

	has_secure_password

	has_many :events

	validates :name, :email, :password, presence: true
end
