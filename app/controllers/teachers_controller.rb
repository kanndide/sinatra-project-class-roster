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

  	get '/teachers/create_course' do
  		erb :'/teachers/create_course'
  	end

  	post '/teachers/create_course' do
  		@course = Course.create(params)
  		@course.teacher_id = current_user.id
  		@course.save
  		redirect '/teachers/home'
  	end

  	get '/teachers/create_student' do
  		@courses = current_user.courses
  		if @courses
  			erb :'/teachers/create_student'
  		else
  			redirect '/login'
  		end
  	end

  	post '/teachers/create_student' do
  		@student = Student.create(params[:student])
  		@course = Course.find_by(params[:course])
  		@student.student_courses.create(course: @course)
  		@student.save
  	end

end