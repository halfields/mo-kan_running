class EventsController < ApplicationController 

	get '/events/new' do #load the new form
		erb :new
	end

	get '/events' do #loads the index page
		@events = Event.all 
		erb :index
	end

	get'/events/:id' do #load the show page
		@event = Event.find(params[:id]) 
		erb :show
	end

	get '/events/:id/edit' do #loads edit form
		@event = Event.find(params[:id])
		erb :edit
	end

	post '/events' do #creates an event
		@event = Event.create(params)
		@races = []
		@races << "Fun Run" if params[:fun_run]
		@races << "5K" if params[:five_k]
		@races << "10K" if params[:ten_k]
		@races << "Half Marathon" if params[:half_marathon]
		@races << "Marathon" if params[:marathon]
		@races << "Ultra" if params[:ultra]
		redirect_to "/events/#{@event.id}"
	end

	patch '/events/:id' do #updates an event
		@event = Event.find(params[:id])
		if current_organizer && @event.organizer_id == current_organizer.id
			@event.name = params[:name]
			@event.date = params[:date]
			@event.contact_info = params[:contact_info]
			@event.message = params[:message]
			@event.fun_run = params[:fun_run]
			@event.five_k = params[:five_k]
			@event.ten_k = params[:ten_k]
			@event.half_marathon = params[:half_marathon]
			@event.marathon = params[:marathon]
			@event.ultra = params[:ultra]
			@event.update
			redirect_to "/event/#{@event.id}" 
		else
			flash[:message] = "You are not authorized to edit this event"
		end
	end

	delete '/events/:id' do #delete anevent
		@event = Event.find(params[:id])
		@event.delete
		redirect_to "/events/index"
	end

end
