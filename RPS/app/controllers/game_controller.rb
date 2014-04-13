class GameController < ApplicationController
  def lobby
	#send to lobby view
	@game = Games.where(:open => 1).where.not(:game_creator => session[:user_id]).group("created_at ASC")
  end

  def help
	render('login/help')
	#send to help view
  end

  def submit
	if session != nil && session[:user_id] != nil
		render('game/submit')
		return true;
	else 
		flash[:notice] = "Must be logged in to create a game"
		redirect_to('/login/index.html')
		return true;
	end
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
	if (@g.open == false)
		flash[:notice] = "This game does not exist"
		render('login/index')
		return
	end
	@chall = User.find_by_id(session[:user_id])
	@user = User.find_by_id(@g.game_creator)
	if(@chall.id == @user.id)
		flash[:notice] = "You can not play a game you created"
		redirect_to('/login/index.html') # {:controller => "login", :action => "index"}
		return true;
	end
       	if(@g.move == "rock")
		@user.ties = @user.ties + 1
		@chall.ties = @chall.ties + 1
		flash[:notice] = "Tie game" 
       	elsif (@g.move == "scissors")
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
	if (@g.open == false)
		flash[:notice] = "This game does not exist"
		render('login/index')
		return
	end
	@chall = User.find_by_id(session[:user_id])
	@user = User.find_by_id(@g.game_creator)
	if(@chall.id == @user.id)
		flash[:notice] = "You can not play a game you created"
		redirect_to('/login/index.html')
		return true;
	end
       	if(@g.move == "rock")
		@user.loses = @user.loses + 1
		@chall.wins = @chall.wins + 1
		flash[:notice] = "You won!"    				
       	elsif (@g.move == "scissors")
		@user.wins = @user.wins + 1
		@chall.loses = @chall.loses + 1
		flash[:notice] = "You lost :c"    				
       	else
		@user.ties = @user.ties + 1
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
	if (@g.open == false)
		flash[:notice] = "This game does not exist"
		render('login/index')
		return
	end
	@chall = User.find_by_id(session[:user_id])
	@user = User.find(@g.game_creator)
	if(@chall.id == @user.id)
		flash[:notice] = "You can not play a game you created"
		redirect_to('/login/index.html')
		return true;
	end
       	if(@g.move == "rock")
		@user.wins = @user.wins + 1
		@chall.loses = @chall.loses + 1
		flash[:notice] = "You lost :c"	
	elsif (@g.move == "paper")
		@user.loses = @user.loses + 1
		@chall.wins = @chall.wins + 1
		flash[:notice] = "You won!" 
       	elsif (@g.move == "scissors")
		@user.ties = @user.ties + 1
		@chall.ties = @chall.ties + 1
		flash[:notice] = "Tie game"    		   		
       	end
	@user.save
	@chall.save
	@g.open = false
	@g.save
	redirect_to('/login/index')
  end

  def submitChallenge
	@game = Games.find_by_id(params[:id])
	if (@game.open == false)
		flash[:notice] = "This game does not exist"
		render('login/index')
		return
	end
	if session[:user_id] != nil
		render('game/submitChallenge')		
		return true;
	else 
		flash[:notice] = "Must be logged in to play a game"
		redirect_to('/login/index.html')
		return true;
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
