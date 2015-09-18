require 'spec_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user = FactoryGirl.create(:user)
    #@user = User.create(email: "coder@skillcrush.com", password: "secret")
  end
  
  after(:all) do
    if !@user.destroyed?
      @user.destroy
    end
  end
  
  it 'authenticates and returns a user when valid email and password passed in' do
    User.authenticate(@user.email, @user.password)
  end
  
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }  
  it { should validate_presence_of(:email) }    
  it { should validate_presence_of(:password) }  
  it { should validate_uniqueness_of(:email) }
  
end
