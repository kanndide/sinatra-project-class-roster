require 'spec_helper'

describe "Courses" do
  before do 
    @user = User.create(:name => "Larry Kann") 

    @course =  Course.create(:name => "Physics 101", :semester => "Fall", :period => 1, :user_id => @user.id) 

    student1 = Student.create(:name => "Billy the Kid", :email => "sixgun@gmail.com")

    @course.student_ids = student1.id
    
  end

  it "can be initialized" do
    expect(@course).to be_an_instance_of(Course)
  end

  it "can have a name" do
    expect(@course.name).to eq("Physics 101")
  end

  it "has one user" do
    expect(@course.user).to eq(@user)
  end

  it "can have many students" do
    expect(@course.students.count).to eq(1)
  end

end