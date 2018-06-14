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
		redirect_to "/events/#{@event.id}"
	end

	patch '/events/:id' do #updates an event
		@event = Event.find(params[:id])
		@event.name = params[:name]
		@event.date = params[:date]
		@event.contact_info = params[:contact_info]
		@event.message = params[:message]
		@event.fun_run = params[:fun_run]
		@event.five_k = params[:five_k]
		@event.ten_k = params[:ten_k]
		@event.half_marathon = params[:half_marathon]
		@event.ultra = params[:ultra]
		@event.update
		redirect_to "/event/#{@event.id}"
	end

	delete '/events/:id' do #delete anevent
		@event = Event.find(params[:id])
		@event.delete
		redirect_to "/events/index"
	end


end
