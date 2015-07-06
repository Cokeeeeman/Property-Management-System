require 'rspec'
require 'rest_client'
require 'json_expressions/rspec'

#index--------------------------------------------------------------------------
describe 'List all rooms' do
  it 'room#index, should return 200 when asking the list of the rooms' do
    url = "https://holidale-cokeeeeman.c9.io/rooms.json"
    result = RestClient.get url,  :content_type => :json, :accept => :json
    expect(result.code).to eq(200)
  end
end 

#show--------------------------------------------------------------------------
describe 'Show the information of the room' do
  it 'room#show, should return 200 when asking the information of certain room' do
    url = "https://holidale-cokeeeeman.c9.io/rooms/1.json"
    result = RestClient.get url,  :content_type => :json, :accept => :json
    expect(result.code).to eq(200)
  end
end  

#new & #create--------------------------------------------------------------------------
describe "Create new room", :type => :request do
  it "renders the page 'new' and creates a room" do
    get "/rooms/new"
    expect(response).to render_template(:new)
    
    ### Here, we can assign the guest with id = 2 to this room,         ###
    ### if we get status code 201, that means we successfully make the  ###
    ### assignment.                                                     ###
    url = "https://holidale-cokeeeeman.c9.io/rooms.json"
    result = RestClient.post(url, :room => {:name => "TestRoom", :guest_id => 2 })
    expect(result.code).to eq(201)
  end
end

#edit & #update--------------------------------------------------------------------------
describe "Update a room", :type => :request do
  before :each do 
    @room = Room.find_by(name: "TestRoom")
  end
  
  it "renders the page 'edit' and updates a room" do
    get "/rooms/" + @room.id.to_s + "/edit"
    expect(response).to render_template(:edit)
    
    ### Here, we re-assign the guest with id = 3 to this room,          ###
    ### if we get status code 200, that means we successfully make the  ###
    ### assignment.                                                     ###
    url = "https://holidale-cokeeeeman.c9.io/rooms/" + @room.id.to_s + ".json"
    result = RestClient.patch(url, :room => {:name => "ChangedTestRoom", :guest_id => 3 })
    
    expect(result.code).to eq(200)
  end
end

#delete--------------------------------------------------------------------------
describe "Delete a room", :type => :request do
  before :each do 
      @room = Room.find_by(name: "ChangedTestRoom")
  end
    
  it "destroys the requested room" do
    expect {
      delete "/rooms/" + @room.id.to_s + ".json"
    }.to change(Room, :count).by(-1) 
  end
  
end

