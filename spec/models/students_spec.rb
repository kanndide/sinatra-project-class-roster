require 'spec_helper'

describe "Students" do
  before do 
    @user = User.create(:name => "Larry Kann") 

    @course =  Course.create(:name => "Physics 101", :semester => "Fall", :period => 1, :user_id => @user.id) 

    @student = Student.create(:name => "Billy the Kid", :email => "sixgun@gmail.com")

    @course.student_ids = @student.id
    
  end

  it "can be initialized" do
    expect(@student).to be_an_instance_of(Student)
  end

  it "can have a name" do
    expect(@student.name).to eq("Billy the Kid")
  end

  it "can have many users" do
    expect(@student.users.count).to eq(1)
  end

  it "can have many students" do
    expect(@student.courses.count).to eq(1)
  end

end