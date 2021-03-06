class User < ActiveRecord::Base

	has_secure_password
	def self.authenticate(email, password)
	  @user = User.find_by_email(email)
	 
	  if !@user.nil?
	    if @user.authenticate(password)
	      return @user
	    end
	  end
	 
	  return nil
	end

	def followed
	    #Follower.where("follower_id=?", self.id)
		Follower.where("follower_id=?", self.id).map{|f| f.user }
	end

	def not_followed
		User.all - self.followed - [self]
	end

	validates_presence_of :first_name, :last_name, :email, :password
	validates_uniqueness_of :email
	has_many :pinnings
  	has_many :pins, through: :pinnings
  	has_many :boards
  	has_many :followers

end

	
