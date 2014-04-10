class LoginController < ApplicationController
  def index
    @user = User.new
    @login_user = User.new
  end

  def create
    	# 1. instantiate a new object using form parameters
	@user = User.new(:user_name => params[:id], :password => params[:password])
	@user.wins = 0;
	@user.loses = 0;
	@user.ties = 0;
	@user.create_at = Time.now;
	if @user.save
		redirect_to('/login/index')	
	else
		render('new')
	end
  end

  def signup
	@user = User.new
  end

  def lobby
  @user_signin = User.new
	@game = Games.where(:open => true).group("created_at ASC")
  end

  def leaders
  @user_signin = User.new
	@user = User.all.group("wins DESC")
  end

  def leadersRatio
	@user = User.all.group("wins / loses DESC")
  end

  def leadersLL
	@user = User.all.group("loses ASC")
  end

  def parseUser
	@user = User.new(params);
	puts "Read User: #{@user}";
  end
end
