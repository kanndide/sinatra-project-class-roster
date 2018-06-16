require 'spec_helper'

describe "Courses" do
  before do 
    @teacher = Teacher.create(:name => "Larry Kann", username: "LKann", :email => "lkann@school.com", :password => "idts") 

    @course =  Course.create(:name => "Physics 101", :semester => "Fall", :period => 1, :teacher_id => @teacher.id) 

    @student = Student.create(:name => "Billy the Kid", :email => "sixgun@gmail.com",  username: "BtheKid", :password => "idts")

    @course.student_ids = @student.id
    
  end

  it "can be initialized" do
    expect(@course).to be_an_instance_of(Course)
  end

  it "can have a name" do
    expect(@course.name).to eq("Physics 101")
  end

  it "has one teacher" do
    expect(@course.teacher).to eq(@teacher)
  end

  it "can have many students" do
    expect(@course.students.count).to eq(1)
  end

end