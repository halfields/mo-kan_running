require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base 

	enable :sessions
	set :session_secret, "hals_secret"
	set :views, Proc.new {File.join(root, "../views/")}
  use Rack::Flash

	get '/' do #load welcome page
		erb :welcome
	end

	get '/signup' do # load signup form
		erb :signup
	end

	post '/signup' do #signup
		if params[:email] == "" || params[:password] == ""
			flash[:error] = "Both email and password needed for signup"
			erb :signup
		else
			@organizer = Organizer.create(name: params[:name], email: params[:email], password: params[:password])
			session[:organizer_id] = @organizer.id 
			@events = @organizer.events
		  # binding.pry
			redirect "/organizers/#{@organizer.id}"
		end
	end

		get "/login" do #load login form 
			erb :login 
		end

	post "/login" do # login 
	  @organizer = Organizer.find_by(email: params[:email])
	 # binding.pry
	  if @organizer && @organizer.authenticate(params[:password])
	  	session[:organizer_id] = @organizer.id
	  	redirect "/events"
	  else
	  	flash[:error] = "Login error. Please try again"
	  	erb :login
	  end
	end

	  get "/logout" do # logout
	  	session.clear
	  	redirect "/"
	  end

  helpers do 

  	def logged_in?
  		!!session[:organizer_id]
  	end

  	def current_organizer
  		Organizer.find(session[:organizer_id])
  	end

  	#def current_organizer
  	#	@current_organizer ||= Organizer.find(session[:organizer_id]) if session[:organizer_id]
  	#end

	end

end

