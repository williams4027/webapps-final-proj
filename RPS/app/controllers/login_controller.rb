class LoginController < ApplicationController
  def index
    @user = User.new
  end

  def create
    
  end

  def lobby
	@game = Games.where(:open => true).group("created_at ASC")
  end

  def leaders
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
