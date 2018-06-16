class Course < ActiveRecord::Base
	belongs_to :user
	has_many :student_course
	has_many :students, through: :student_course
	validates_presence_of :name, :semester, :period, :user_id
end




# A class has a name
# Has a semester and a period
# A class has a 
# A class belongs to a teacher
# A class has many students