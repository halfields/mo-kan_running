5t4rThis application is a clearing-house for information regarding running events in the Missouri-Kansas area. There are two models: organizer and event.

Runners (though not a model) can access the website without registering or logging in. They merely come to the site to gather information on running events and leave.

Organizers register and login/out. They can perform all the CRUD operations including delete. They have name, email, and password attributes.

Events have the following attributes: name, date, various racing attributes of boolean variety, contact information, and additional messaging.

Application controller has a root action that renders a welcome page. It also has actions for registration, login, and logout of organizers.

The organizers controller as well as the events controller have full CRUD actions.

A user will come to the welcome page for a  welcome message. If you are an event organizer you will be directed to either signup or login. Runners will be directed to an index of all events

Organizer signup will automatically log organizers in. After signup, organizers will be sent to an index page of that organizer's events with options to edit or delete. The edit option directs to an edit page. There will be an option to create a new event that directs to a new form.


	<<-test
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
	test

stackoverflow.com/questions/27385860/storing-array-in-sqlite-pg-databases-with-activerecord?rq=1

apidock.com/rails/ActiveRecord/Base/serialize/class


