require 'spec_helper'

describe "User" do
  before do 
    @user = User.create(:name => "Larry Kann") 

    # blank_space =  Song.create(:name => "Blank Space", :artist => @artist) 

    # pop = Genre.create(:name => "Pop")

    # blank_space.genre_ids = pop.id
    
  end
  it "can be initialized" do
    expect(@user).to be_an_instance_of(User)
  end

  it "can have a name" do
    expect(@user.name).to eq("Larry Kann")
  end

  # it "has many songs" do
  #   expect(@artist.songs.count).to eq(1)
  # end

  # it "can have many genres" do
  #   expect(@artist.genres.count).to eq(1)
  # end

  # it "can slugify its name" do

  #   expect(@artist.slug).to eq("taylor-swift")
  # end

  # describe "Class methods" do
  #   it "given the slug can find an Artist" do
  #     slug = "taylor-swift"
  #     expect((Artist.find_by_slug(slug)).name).to eq("Taylor Swift")
  #   end
  # end

end