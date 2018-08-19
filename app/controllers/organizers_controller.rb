require 'pry'

class OrganizersController < ApplicationController

	get "/organizers" do # loads event list of a given organizer
		@organizers = Organizer.all
		erb :"organizers/index"

	end

	get "/organizers/:id" do 
		@organizer = Organizer.find(params[:id])
		erb :"organizers/show"
	end

	delete "/organizers/:id" do
		@organizer = Organizer.find(params[:id])
		@organizer.delete
		redirect "/organizers"
	end

end
