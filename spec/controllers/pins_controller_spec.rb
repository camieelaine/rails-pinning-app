require 'spec_helper'
RSpec.describe PinsController do
	describe "GET index" do
 
    it 'renders the index template' do
      get :index
     #expect the index template to be rendered in the response to that GET request
      expect(response).to render_template("index")
    end
  
    it 'populates @pins with all pins' do
    
    end
    
  end
	#expect(actual).to matcher(expected)
	#expect(actual).not_to matcher(expecteds)
		
end