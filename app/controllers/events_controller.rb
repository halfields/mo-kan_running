require 'rack-flash'
require 'pry'

class EventsController < ApplicationController 
use Rack::Flash 

	get '/events/new' do #load the new form
		erb :'events/new'
	end

	get '/events' do #loads the index page
		@events = Event.all 
	#	binding.pry
		erb :'events/index'
	end

	get'/events/:id' do #load the show page
		@event = Event.find(params[:id]) 
		# @races = @event.
		# binding.pry
		erb :'events/show'
	end

	get '/events/:id/edit' do #loads edit form
		@event = Event.find(params[:id])
		erb :'events/edit'
	end



	post '/events' do #creates an event
		@event = Event.create(params)
		# binding.pry
		redirect_to "/events/#{@event.id}"
	end

	delete '/events/:id' do #delete anevent
		@event = Event.find(params[:id])
		@event.delete
		redirect_to "/events/index"
	end

end
