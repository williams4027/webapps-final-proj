class UsersController < ApplicationController
  def new
    @user = User.new(:user_name => "Old Gregg")
  end

  def create
	# 1. instantiate a new object using form parameters
	@user = User.new(user_params)
	if @user.save
		redirect_to('/login/index')	
	else
		render('new')
	end
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :password)
  end

end
