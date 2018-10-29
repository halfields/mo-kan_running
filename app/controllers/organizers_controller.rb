require 'pry'

class OrganizersController < ApplicationController

	get "/organizers" do 
		@organizers = Organizer.all
		erb :"organizers/index"

	end

	get "/organizers/:id" do 
		@organizer = Organizer.find(params[:id])
	#	binding.pry
	#	if @organizer[:id] == session[:organizer_id]
		erb :"organizers/show"
	end

	delete "/organizers/:id" do
		@organizer = Organizer.find(params[:id])
		@organizer.delete
		redirect "/organizers"
	end

end
