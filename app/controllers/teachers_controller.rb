class TeachersController < ApplicationController
	
	get '/teachers/signup' do
		erb :'/teachers/create'
	end

	post '/teachers/signup' do
		binding.pry
    @teacher = Teacher.create(params)
  
	    if @teacher.save && params[:username] != "" && params[:password] != ""
	      session[:user_id] = @teacher.id
	      redirect '/teachers/home'
	    else
	      redirect '/signup'
	    end
  	end

  	get '/teachers/home' do
  		erb :'/teachers/home'
  	end


end