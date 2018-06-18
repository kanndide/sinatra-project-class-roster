class Student < ActiveRecord::Base
	has_many :student_courses
	has_many :courses, through: :student_courses
	has_many :teachers, through: :courses
	has_secure_password validations: false
	validates_presence_of :name, :email
end
