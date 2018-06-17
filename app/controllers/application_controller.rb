class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :views, Proc.new { File.join(root, "../views/") }
  enable :sessions
  set :session_secret, "my_application_secret"

  get '/' do
    erb :index
  end

  get '/signup' do 
  	 erb :'/public/signup'
  end

  post '/signup' do
    if params[:teacher]
      redirect 'teachers/create'
    elsif params[:student]
      redirect 'student/create'
    end
  end

  post "/signup" do
    @user = User.create(params)
  
    if @user.save && params[:username] != "" && params[:password] != ""
      session[:user_id] = @user.id
      redirect '/tweets'
    else
      redirect '/signup'
    end
  end

  get '/login' do
  	if logged_in?
    	redirect '/'
    else
  		erb :'/users/login'
  	end
  end

  post "/login" do
    user = User.find_by(:username => params[:username])
    
    if user && user.authenticate(params[:password]) && params[:username] != "" && params[:password] != ""
        session[:user_id] = user.id
        redirect "/tweets"
    else
        redirect "/failure"
    end

  end

  get '/logout' do
  	session.clear
    redirect "/login"
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  end

end