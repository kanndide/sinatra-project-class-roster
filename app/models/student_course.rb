class StudentCourse < ActiveRecord::Base
	belongs_to :student 
	belongs_to :class
	validates_presence_of :student_id, :class_id
end