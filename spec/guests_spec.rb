require 'rspec'
require 'rest_client'
require 'json_expressions/rspec'

#index--------------------------------------------------------------------------
describe 'List all guests' do
  it 'guest#index, should return 200 when asking the list of the guests' do
    url = "https://holidale-cokeeeeman.c9.io/guests.json"
    result = RestClient.get url,  :content_type => :json, :accept => :json
    expect(result.code).to eq(200)
  end
end 

#show--------------------------------------------------------------------------
describe 'Show the information of the guest' do
  it 'guest#show, should return 200 when asking the information of certain guest' do
    url = "https://holidale-cokeeeeman.c9.io/guests/2.json"
    result = RestClient.get url,  :content_type => :json, :accept => :json
    expect(result.code).to eq(200)
  end
end  

#new & #create--------------------------------------------------------------------------
describe "Create new guest", :type => :request do
  it "renders the page 'new' and creates a guest" do
    get "/guests/new"
    expect(response).to render_template(:new)
    
    url = "https://holidale-cokeeeeman.c9.io/guests.json"
    result = RestClient.post(url, :guest => {:name => "Ceshi", :email => "ceshi@ceshi.com"})
    expect(result.code).to eq(201)
  end
end

#edit & #update--------------------------------------------------------------------------
describe "Update a guest", :type => :request do
  before :each do 
    @guest = Guest.find_by(email: "ceshi@ceshi.com")
  end
  
  it "renders the page 'edit' and updates a guest" do
    get "/guests/2/edit"
    expect(response).to render_template(:edit)
    
    url = "https://holidale-cokeeeeman.c9.io/guests/" + @guest.id.to_s + ".json"
    result = RestClient.patch(url, :guest => {:name => "Xiugai", :email => "xiugai@xiugai.com"})
    
    expect(result.code).to eq(200)
  end
end

#delete--------------------------------------------------------------------------
describe "Delete a guest", :type => :request do
  before :each do 
      @guest = Guest.find_by(email: "xiugai@xiugai.com")
  end
    
  it "destroys the requested guest" do
    expect {
      delete "/guests/" + @guest.id.to_s + ".json"
    }.to change(Guest, :count).by(-1) 
  end
  
end

