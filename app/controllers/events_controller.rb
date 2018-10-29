
require 'date'
require 'rack-flash'
require 'pry'

class EventsController < ApplicationController 
use Rack::Flash 

	get '/events/new' do #load the new form
		if logged_in? #only logged in organizers can see a new events form
			@organizer = current_organizer #an organizer instance variable is needed in a hidden field of the new form
		  erb :'events/new'
		else
			redirect '/login' # if not logged in redirect to the get "/login " action in application controller
		end
	end

	get '/events' do #loads the index page
		Event.where("date < ?", Date.today).delete_all #delete all events that take place prior to today's date
		@events = Event.order(date: :asc) #order events by date, earliest to latest
		erb :'events/index' #render events/index page
	end

	get '/events/:id' do #load the show page
		#raise params.inspect
		if @event = Event.find_by(id: params[:id]) #find event whose id equals params[:id] 
  		erb :'events/show' #render events/show page
  	else
  		flash[:message] = "you are trying to access an event that does not exist"
  		redirect "/events"
  	end
	end

	get '/events/:id/edit' do #loads edit form
	#	raise params.inspect
		if @event = Event.find_by(id: params[:id]) #find event in database whose id equals params[:id]
	#	binding.pry
			if current_organizer && current_organizer[:id] == @event[:organizer_id] #check to see there is a current_organizer and that the event belongs to that organizer
				@organizer = current_organizer #an organizer instance variable is needed in a hidden field of the edit form
				erb :'events/edit' #render edit form
			else
			#	raise params.inspect
				flash[:error] = "Not authorized to edit this event" 
				erb :"events/show"
			end
		else
			flash[:message] = "You are trying to edit an event that does not exist"
			redirect "/events"
		end
	end



	post '/events' do #creates an event 
		#raise params.inspect
		@event = Event.new(name: params[:name], date: params[:date], contact_email: params[:contact_email], message: params[:message], location: params[:location], start_time: params[:start_time], organizer_id: params[:organizer_id])
		if params[:races]
			params[:races].each do |hash| #iterate the params[:races] array; each element of the array is a hash with a race name
				race = Race.create(name: hash.values[0])	#create a race
				@event.races<< race #add the race to the collection of races for @event
			end
		else
			flash[:message] = "Race list is empty"
		end

		if @event.save
		#	redirect "/events" #if the event saves, then go to the get "/events" action
			erb :"events/show"
		else
			flash[:error] = "New event didn't save. Does the event have a unique name and a date?"
			redirect "/events/new" #if the event doesn't save, go to get "/events/new" action with an error message
		end
	end

	patch '/events/:id' do #edit an event
	#	raise params.inspect
		if logged_in? #check to see if there is an organizer logged in
			if params[:name].empty? || params[:date].empty? #make sure edited name has a name and a date
				flash[:notice] = "Both name and date fields must be filled out"
				redirect "/events/#{params[:id]}/edit" #if name or date fields are empty, then go to the get "/events/:id/edit" action with a notice message
			else
				@event = Event.find_by_id(params[:id]) #find the event to be edited
				if @event && @event.organizer == current_organizer #check to see that the desired event exists and the current_organizer is the organizer for that event
					@event.races.clear
					if params[:races] #build the collection of races for this event						
						params[:races].each {|hash| @event.races << Race.create(name: hash.values[0])}
					else
						flash[:message] = "Race list is empty"
					end	
				#	raise params.inspect
					#edit the attributes of the event				
					@event.name = params[:name]
					@event.date = params[:date]
					@event.contact_email = params[:contact_email]
					@event.message = params[:message]
					@event.location = params[:location]
					@event.start_time = params[:start_time]				
					@event.organizer_id = params[:organizer_id]
					if @event.save #save the edited event back to the database and go to get "/events/:id" action
					#	redirect "/events/#{@event.id}"
						erb :"events/show"
					else #if the edited event doesn't save, go to the get "/events/:id/edit" action with a notice
						flash[:notice] = "Event not saved"
						redirect "/events/#{@event.id}/edit"
					end
				else #if the desired event could not be found in the db, or the organizer is not the correct one, go to get "/events/:id/edit action" with a notice
				#	raise params.inspect
					flash[:notice] = "Unable to edit this record. Are you logged in? Is this your event?"
				#	redirect "/events/#{params[:id]}/edit"
					erb :"events/edit"
				end
			end
		else #if not logged in, go to the get "/login" action
			redirect "/login"
		end
	end

	delete '/events/:id' do #delete an event
		@event = Event.find(params[:id]) #find event
		@event.delete #delete event
		redirect "/events" #go to get "/events" action
	end
end
