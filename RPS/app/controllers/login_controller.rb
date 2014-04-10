class LoginController < ApplicationController
  def new
  	@user = User.new
#	@login_user = User.new
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

  def sign_in
	@user = User.new
  end

  def login
    username = params[:user][:username]
    password = params[:user][:password]

    user = User.authenticate_by_username(username, password)

    if user
      session[:user_id] = user.id
      flash[:notice] = 'Welcome.'
      redirect_to :root
    else
      flash.now[:error] = 'Unknown user. Please check your username and password.'
      render :action => "sign_in"
    end

  end

  def signed_out
	session[:user_id] = nil
	flash[:notice] = "You have been signed out."
  end

  def new_user
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
