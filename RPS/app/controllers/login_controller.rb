class LoginController < ApplicationController
  def index
    @user = User.new
  end
  def create
    
  end
  def parseUser
	@user = User.new(params);
	puts "Read User: #{@user}";
  end
end
