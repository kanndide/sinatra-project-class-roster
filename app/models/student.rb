class Student < ActiveRecord::Base
	has_many :student_courses
	has_many :courses, through: :student_courses
	has_many :users, through: :courses
	validates_presence_of :name, :email
end


# A student has a name and email
# A student has many classes
# A student has many teachers through classes
