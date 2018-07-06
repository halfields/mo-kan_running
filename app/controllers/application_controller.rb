class ApplicationController < Sinatra::Base 

	enable :sessions
	set :session_secret, "hals_secret"
	set :views, Proc.new {File.join(root, "../views/")}

	get '/' do #load welcome page
		erb :welcome
	end
end
