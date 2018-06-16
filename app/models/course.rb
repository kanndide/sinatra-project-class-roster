class Course < ActiveRecord::Base
	belongs_to :teacher
	has_many :student_course
	has_many :students, through: :student_course
	validates_presence_of :name, :semester, :period, :teacher_id
end