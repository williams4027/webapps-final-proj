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
	render('game/submit')
	#if(
	#controller's job to gather data (aka RPS from existing game)
	#to render output to the submit view
	#send to submit view
  end

  def rock
  	@game = Games.new(:game_creator => 3, :move =>"rock", :open =>"true")
	if @game.save
		redirect_to('/login/index')	
	end
  end

  def paper
  	@game = Games.new(:game_creator => 2, :move =>"paper", :open =>"true")
	if @game.save
		redirect_to('/login/index')	
	end
  end

  def scissors
  	@game = Games.new(:game_creator => 1, :move =>"scissors", :open =>"true")
	if @game.save
		redirect_to('/login/index')	
	end
  end

  def rockC
	@g = Games.find_by_id(params[:id])
	@user = User.find(@g.game_creator)
       	if(@g.move = "rock")
		@user.ties = @user.ties + 1
       	elsif (@g.move = "scissors")
		@user.loses = @user.loses + 1		
       	else
		@user.wins = @user.wins + 1      
       	end
	@user.save
	@g.open = false
	@g.save
	redirect_to('/login/index')
  end

	
  def paperC
	@g = Games.find_by_id(params[:id])
	@user = User.find(@g.game_creator)
       	if(@g.move = "rock")
		@user.loses = @user.loses + 1		
       	elsif (@g.move = "scissors")
		@user.wins = @user.wins + 1		
       	else
		@user.ties = @user.ties +1		
       	end
	@user.save
	@g.open = false
        @g.save
	redirect_to('/login/index')
  end

  def scissorC
	@g = Games.find_by_id(params[:id])
	@user = User.find(@g.game_creator)
       	if(@g.move = "rock")
		@user.wins = @user.wins + 1		
       	elsif (@g.move = "scissors")
		@user.ties = @user.ties + 1		
       	else
		@user.loses = @user.loses + 1		
       	end
	@user.save
	@g.open = false
	@g.save
	redirect_to('/login/index')
  end

  def submitBattle
	render('game/submitChallenge')
  end
	#if user creates a game, user enters rock, paper, or scissors.
	#then submits the game. the database is then updated with new game
		



	#if user enters an already existing game, then the existing game
	#is pulled from the database (aka other user's rock, paper, or
	#scissors). Then, the current user enters rock, paper, or scissors.
	#The database is then updated with W/L for each user and deletes
	#game from database.

end
