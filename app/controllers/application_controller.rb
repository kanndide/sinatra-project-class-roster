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

  get '/login' do
  	if logged_in?
    	redirect '/'
    else
  		erb :'/public/login'
  	end
  end

  post "/login" do

    user = Teacher.find_by(:username => params[:username]) || Student.find_by(:username => params[:username])
    
    if user && user.authenticate(params[:password]) && params[:username] != "" && params[:password] != ""
        session[:user_id] = user.id
        if user.instance_of?(Teacher)
          redirect '/teachers/home'
        elsif user.instance_of?(Student)
          redirect '/students/home'
        end
    else
        redirect "/failure"
    end

  end

  get '/failure' do
    erb :'/public/failure'
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