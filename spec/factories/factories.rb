FactoryGirl.define do
	factory :user do
		sequence(:email) { |n| "coder#{n}@skillcrush.com" }
		first_name "Skillcrush"
		last_name "Coder"
		password "secret"
	end

	factory :board do
	  name "My Pins!"  
	end

	factory :user do 
	  email 
	  first_name "Skillcrush"
	  last_name "Coder"
	  password "secret"
	 
	  after(:create) do |user|
	    user.boards << FactoryGirl.create(:board)
	    3.times do
	      user.pinnings.create(pin: FactoryGirl.create(:pin), board: user.boards.first)
	    end
	  end
	end  

	
end