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
			erb :signup
		else
			Organizer.create(email: params[:email], password: params[:password])
			redirect '/login'
		end
end
