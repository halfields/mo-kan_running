
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
		binding.pry
		if current_organizer && current_organizer[:id] == @event[:organizer_id]
			@organizer = current_organizer
			erb :'events/edit'
		else
			flash[:error] = "Not authorized to edit this event"
			erb :"events/show"
		end
	end



	post '/events' do #creates an event 
#		raise params.inspect
#		@event = Event.find_or_create_by(params)
		@event = Event.find_or_create_by(name: params[:name], date: params[:date], location: params[:location], start_time: params[:start_time], contact_email: params[:contact_email], message: params[:message], organizer_id: params[:organizer_id])		
		races = params[:races]

		races_string = races.join(",")

	  @event.races_string = races_string
	  @event.save
		redirect "/events"
	end

	patch '/events/:id' do #edit an event
		if logged_in?
	#		raise params.inspect
			if params[:name].empty? || params[:date].empty?
				flash[:notice] = "Both name and date fields must be filled out"
				redirect "/events/#{params[:id]}/edit"
			else
				@event = Event.find_by_id(params[:id])

				if @event && @event.organizer == current_organizer
					races = params[:races]
					races_string = races.join(",")					
					@event.name = params[:name]
					@event.date = params[:date]
					@event.contact_email = params[:contact_email]
					@event.message = params[:message]
					@event.location = params[:location]
					@event.start_time = params[:start_time]				
					@event.races_string = races_string
					@event.organizer_id = params[:organizer_id]
					if @event.save
						redirect "/events/#{@event.id}"
					else
						flash[:notice] = "Event not saved"
						redirect "/events/#{@event.id}/edit"
					end
				else
					flash[:notice] = "Unable to edit this record. Are you logged in? Is this your event?"
					redirect "/events/#{params[:id]}/edit"
				end
			end
		else
			redirect "/login"
		end
	end

	delete '/events/:id' do #delete an event
	#	raise params.inspect
		@event = Event.find(params[:id])
		@event.delete
		redirect "/events"
	end

end
