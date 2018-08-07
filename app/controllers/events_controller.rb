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

	get '/events/:id' do #load the show page
		@event = Event.find(params[:id]) 
		races = @event.races_string
		@races = races.split(",")
		# binding.pry
		erb :'events/show'
	end

	get '/events/:id/edit' do #loads edit form
		@event = Event.find(params[:id])
		erb :'events/edit'
	end



	post '/events' do #creates an event 
		@event = Event.find_or_create_by(name: params[:name], date: params[:date], location: params[:location], start_time: params[:start_time], contact_info: params[:contact_info], message: params[:message])		
		races = params[:races]
		# binding.pry
		# raise params.inspect
		races_string = races.join(",")

	  # binding.pry
	  # raise params.inspect
	  @event.races_string = races_string
	  @event.save
		redirect "/events"
	end

	patch '/events/:id' do #edit an event
	end

	delete '/events/:id/delete' do #delete an event
		@event = Event.find(params[:id])
		@event.delete
		redirect "/events"
	end

	private


end
