class UsersController < ApplicationController
  def create
    user = User.new(:user_name => "blake") #params["user"]["user_name"] )
    user.save;
    redirect_to('/login/index')

  end
end
