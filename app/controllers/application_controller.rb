class ApplicationController < Sinatra::Base 

	enable :sessions
	set :session_secret, "hals_secret"
	set :views, Proc.new {File.join(root, "../views/")}

	get '/' do #load welcome page
		erb :welcome
	end

	get '/signup' do # load signup form
		erb :signup
	end

	post '/signup' do # signup 
		if params[:email] == "" || params[:password] 
			flash[:alert] "Need email and password fields filled out."
			render :signup
		else
			Organizer.create(email: params[:email], password: params[:password])
			redirect '/login'
		end
	end

	get '/login' do #load login form
		erb :login
	end

	post '/login' do #login
		@organizer = Organizer.find_by(email: params[:email])
		if @organizer && @organizer.authenticate(params[:password])
			session[:organizer_id] = @organizer.id		
		else
			flash[:alert] "Login failed. Please try again."
			render :login
		end
	end

	helpers do 

		def logged_in?
			!!session[:organizer_id]
		end

		def current_user
			Organizer.find(:organizer_id)
		end

	end
	
end
