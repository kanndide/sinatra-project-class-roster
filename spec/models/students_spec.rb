require 'spec_helper'

describe "Student" do
  before do 
    @teacher = Teacher.create(:name => "Larry Kann", username: "LKann", :email => "lkann@school.com", :password => "idts") 

    @course =  Course.create(:name => "Physics 101", :semester => "Fall", :period => 1, :teacher_id => @teacher.id) 

    @student = Student.create(:name => "Billy the Kid", :email => "sixgun@gmail.com",  username: "BtheKid", :password => "idts")

    @course.student_ids = @student.id
    
  end

  it "can be initialized" do
    expect(@student).to be_an_instance_of(Student)
  end

  it "can have a name" do
    expect(@student.name).to eq("Billy the Kid")
  end

  it "can have many teachers" do
    expect(@student.teachers.count).to eq(1)
  end

  it "can have many courses" do
    expect(@student.courses.count).to eq(1)
  end

end