require 'spec_helper'

describe "Teacher" do
  before do 
    @teacher = Teacher.create(:name => "Larry Kann", username: "LKann", :email => "lkann@school.com", :password => "idts") 

    physics =  Course.create(:name => "Physics 101", :semester => "Fall", :period => 1, :teacher_id => @teacher.id) 

    student1 = Student.create(:name => "Billy the Kid", :email => "sixgun@gmail.com",  username: "BtheKid", :password => "idts")

    physics.student_ids = student1.id
    
  end
  
  it "can be initialized" do
    expect(@teacher).to be_an_instance_of(Teacher)
  end

  it "can have a name" do
    expect(@teacher.name).to eq("Larry Kann")
  end

  it "has many courses" do
    expect(@teacher.courses.count).to eq(1)
  end

  it "can have many students" do
    expect(@teacher.students.count).to eq(1)
  end

end