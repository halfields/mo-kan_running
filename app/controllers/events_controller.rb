
require 'date'
require 'rack-flash'
require 'pry'

class EventsController < ApplicationController 
use Rack::Flash 

	get '/events/new' do #load the new form
		if logged_in?
			@organizer = current_organizer
		  erb :'events/new'
		else
			redirect '/login'
		end
	end

	get '/events' do #loads the index page
		@events = Event.all 
	#	binding.pry
		erb :'events/index'
	end

	get '/events/:id' do #load the show page
		@event = Event.find(params[:id]) 
		races = @event.races_string || "No races listed"
		# binding.pry
		# raise params.inspect
		@races = races.split(",")
		# binding.pry
		erb :'events/show'
	end

	get '/events/:id/edit' do #loads edit form
		@event = Event.find(params[:id])
		if current_organizer && current_organizer[:id] == @event[:organizer_id]
			@organizer = current_organizer
			erb :'events/edit'
		else
			flash[:error] = "Not authorized to edit this event"
			erb :"events/show"
		end
	end



	post '/events' do #creates an event 
		@event = Event.find_or_create_by(name: params[:name], date: params[:date], location: params[:location], start_time: params[:start_time], contact_info: params[:contact_info], message: params[:message])		
		races = params[:races]

		races_string = races.join(",")

	  @event.races_string = races_string
	  @event.save
		redirect "/events"
	end

	patch '/events/:id' do #edit an event
		if logged_in?
			if params[:name].empty? || params[:date].empty?
				redirect "/events/#{params[:id]}/edit"
			else
				@event = Event.find_by_id(params[:id])

				if @event && @event.organizer == current_organizer
					@event.name = params[:name]
					@event.date = params[:date]
					@event.contact_info = params[:contact_info]
					@event.message = params[:message]
					@event.location = params[:location]
					@event.start_time = params[:start_time]				
					@event.races_string = params[:races_string]
					if @event.save
						raise "saved".inspect
						redirect "/events/#{@event.id}"
					else
						raise "not saved".inspect
						redirect "/events/#{@event.id}/edit"
					end
				else
					redirect "/events"
				end
			end
		else
			redirect "/login"
		end
	end

	delete '/events/:id' do #delete an event
		@event = Event.find(params[:id])
		@event.delete
		redirect "/events"
	end

end
