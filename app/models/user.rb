class User
	has_many :courses
	has_many :students, through: :courses
	validates_presence_of :name
end



# A user is a teacher.
# A user has a name.
# A user has many classes
# a User has many students through classes