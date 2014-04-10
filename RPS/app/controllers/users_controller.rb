class UsersController < ApplicationController
  def new
    redirect_to('login/login')
  end

  def wait
  end

  def create
	# 1. instantiate a new object using form parameters
	@user = User.new(user_params)
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

  def login
	@log_user = User.new(:user_name => "logged in", :password => "test")
	@log_user.save	
	redirect_to('/login/index')
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :password)
  end

end
