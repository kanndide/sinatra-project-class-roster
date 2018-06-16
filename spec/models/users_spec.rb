require 'spec_helper'

describe "User" do
  before do 
    @user = User.create(:name => "Larry Kann") 

    physics =  Course.create(:name => "Physics 101", :semester => "Fall", :period => 1, :user_id => @user.id) 

    student1 = Student.create(:name => "Billy the Kid", :email => "sixgun@gmail.com")

    physics.student_ids = student1.id
    
  end
  
  it "can be initialized" do
    expect(@user).to be_an_instance_of(User)
  end

  it "can have a name" do
    expect(@user.name).to eq("Larry Kann")
  end

  it "has many courses" do
    expect(@user.courses.count).to eq(1)
  end

  it "can have many students" do
    expect(@user.students.count).to eq(1)
  end

end