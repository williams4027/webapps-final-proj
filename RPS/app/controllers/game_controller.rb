class GameController < ApplicationController
  def lobby
	#send to lobby view
	@game = Games.where(:open => 1).group("created_at ASC")
  end

  def help
	render('login/help')
	#send to help view
  end

  def submit
	if session[:user_id] != nil
		render('game/submit')
	else 
		flash[:notice] = "Must be logged in to create a game"
		redirect_to(:controller => 'login', :action => 'index')
	end
	#if(
	#controller's job to gather data (aka RPS from existing game)
	#to render output to the submit view
	#send to submit view
  end

  def rock
  	@game = Games.new(:game_creator => session[:user_id], :move => "rock" , :open =>true)
	if @game.save
		flash[:notice] = "Game successfully created"    
		redirect_to('/login/index')	
	end
  end

  def paper
  	@game = Games.new(:game_creator => session[:user_id], :move =>"paper", :open =>"true")
	if @game.save
		flash[:notice] = "Game successfully created" 
		redirect_to('/login/index')	
	end
  end

  def scissors
  	@game = Games.new(:game_creator => session[:user_id], :move =>"scissors", :open =>"true")
	if @game.save
		flash[:notice] = "Game successfully created"
		redirect_to('/login/index')	
	end
  end

  def rockC
	@g = Games.find_by_id(params[:id])
	@chall = User.find_by_id(session[:user_id])
	@user = User.find_by_id(@g.game_creator)
	if(@chall.id == @user.id)
		flash[:notice] = "You can not play a game you created"
		redirect_to{:controller => "login", :action => "index"}
	end
       	if(@g.move = "rock")
		@user.ties = @user.ties + 1
		@chall.ties = @chall.ties + 1
		flash[:notice] = "Tie game" 
       	elsif (@g.move = "scissors")
		@user.loses = @user.loses + 1
		@chall.wins = @chall.wins + 1
		flash[:notice] = "You won!" 	
       	else
		@user.wins = @user.wins + 1
		@chall.loses = @chall.loses + 1
		flash[:notice] = "You lost :c"    
       	end
	@user.save
	@chall.save
	@g.open = false
	@g.save
	redirect_to('/login/index')
  end

	
  def paperC
	@g = Games.find_by_id(params[:id])
	@chall = User.find_by_id(session[:user_id])
	@user = User.find_by_id(@g.game_creator)
	if(@chall.id == @user.id)
		flash[:notice] = "You can not play a game you created"
		redirect_to{:controller => "login", :action => "index"}
	end
       	if(@g.move = "rock")
		@user.loses = @user.loses + 1
		@chall.wins = @chall.wins + 1
		flash[:notice] = "You won!"    				
       	elsif (@g.move = "scissors")
		@user.wins = @user.wins + 1
		@chall.loses = @chall.loses + 1
		flash[:notice] = "You lost :c"    				
       	else
		@user.ties = @user.ties +1
		@chall.ties = @chall.ties + 1
		flash[:notice] = "Tie game"    		
       	end
	@user.save
	@chall.save
	@g.open = false
        @g.save
	redirect_to('/login/index')
  end

  def scissorC
	@g = Games.find_by_id(params[:id])
	@chall = User.find_by_id(session[:user_id])
	@user = User.find(@g.game_creator)
	if(@chall.id == @user.id)
		flash[:notice] = "You can not play a game you created"
		redirect_to{:controller => "login", :action => "index"}
	end
       	if(@g.move = "rock")
		@user.wins = @user.wins + 1
		@chall.loses = @chall.loses + 1
		flash[:notice] = "You lost :c"	
       	elsif (@g.move = "scissors")
		@user.ties = @user.ties + 1
		@chall.ties = @chall.ties + 1
		flash[:notice] = "Tie game"    		
       	else
		@user.loses = @user.loses + 1
		@chall.wins = @chall.wins + 1
		flash[:notice] = "You won!"    		
       	end
	@user.save
	@chall.save
	@g.open = false
	@g.save
	redirect_to('/login/index')
  end

  def submitBattle
	if session[:user_id] != nil
		render('game/submitChallenge')
	else 
		flash[:notice] = "Must be logged in to play a game"
		redirect_to(:controller => 'login', :action => 'index')
	end
  end
	#if user creates a game, user enters rock, paper, or scissors.
	#then submits the game. the database is then updated with new game
		



	#if user enters an already existing game, then the existing game
	#is pulled from the database (aka other user's rock, paper, or
	#scissors). Then, the current user enters rock, paper, or scissors.
	#The database is then updated with W/L for each user and deletes
	#game from database.

end
