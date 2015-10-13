require 'spec_helper'
RSpec.describe PinsController do
 #category_id: "2"}

describe "GET index" do
 
    it 'renders the index template' do
      get :index
      expect(response).to render_template("index")
    end
 
    it 'populates @pins with all pins' do
      get :index
      expect(assigns[:pins]).to eq(Pin.all)
    end
  
  end


  describe "GET edit" do
    before(:each) do
      @pin = Pin.create(
        title: "Test Pin", 
        url: "http://example.com", 
        slug: "test-pin", 
        text: "Test pin text", 
       # category_id: Category.find_by_name("rails").id
         category_id: "2")
    end
    
    after(:each) do
      if !@pin.destroyed?
        @pin.destroy
      end
    end
    
    it 'responds successfully' do
      get :edit, id: @pin.id
      expect(response.success?).to be(true)
    end

    it 'renders the new view' do
      get :edit, id: @pin.id      
      expect(response).to render_template(:edit)
    end

    it 'assigns an instance variable to a new pin' do
      get :edit, id: @pin.id
      expect(assigns(:pin)[:id]).to eq(@pin.id)
    end

    #it 'redirects to the login page if user is not logged in' do
     # logout(@user)
    #  get :edit, id: @pin.id
    #  expect(response).to redirect_to("/login")      
    #end
  end
end
