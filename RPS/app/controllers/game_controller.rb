class GameController < ApplicationController
  def lobby
	#send to lobby view
  end

  def help
	#send to help view
  end

  def submit
	
	#controller's job to gather data (aka RPS from existing game)
	#to render output to the submit view
	#send to submit view
  end

	#if user creates a game, user enters rock, paper, or scissors.
	#then submits the game. the database is then updated with new game
		



	#if user enters an already existing game, then the existing game
	#is pulled from the database (aka other user's rock, paper, or
	#scissors). Then, the current user enters rock, paper, or scissors.
	#The database is then updated with W/L for each user and deletes
	#game from database.

end
