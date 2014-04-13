class Games < ActiveRecord::Base

attr_accessible :game_creator, :move, :open
=begin
  def makeGame
     	game = games.new
	game.move = //retrieve from submit.html
	game.game_creator = //retrieve from current user.id
	game.created_at = Time.now
	game.save		
  end

  def openGames
	op = games.where(:open => true)
  end

  def arena
	battle = games.where(:id => //get from submit.html?//)
	gCreator = users.where(:id => //get from submit.html)
        mov2 = //get from arena html//
	gChallenger = users.where(:id => //currently logged in user)
	if (mov2 == "rock")
		if (battle.move == "paper")
			//rock loses
			gChallenger.losses = gChallenger.losses + 1
			gCreator.wins = gCreator.wins + 1
	
		elsif (battle.move == "scissors")
			//rock wins
			gChallenger.wins = gChallenger.wins + 1
			gCreator.losses = gCreator.losses + 1

		else	
			//tie game
			gChallenger.ties = gChallenger.ties + 1
			gCreator.ties = gCreator.ties + 1
		end
	elsif (mov2 == "paper")
		if (battle.move == "rock")
			//paper wins
			gChallenger.wins = gChallenger.wins + 1
			gCreator.losses = gCreator.losses + 1

		elsif (battle.move == "scissors")
			//paper loses
			gChallenger.losses = gChallenger.losses + 1
			gCreator.wins = gCreator.wins + 1

		else	
			//tie game
			gChallenger.ties = gChallenger.ties + 1
			gCreator.ties = gCreator.ties + 1
		end
	else
		if (battle.move == "paper")
			//scissors wins
			gChallenger.wins = gChallenger.wins + 1
			gCreator.losses = gCreator.losses + 1

		elsif (battle.move == "rock")
			//scissors loses
			gChallenger.losses = gChallenger.losses + 1
			gCreator.wins = gCreator.wins + 1

		else	
			//tie game
			gChallenger.ties = gChallenger.ties + 1
			gCreator.ties = gCreator.ties + 1
 		end
	end
	battle.open = false
	battle.save
	gChallenger.save
	gCreator.save
end
=end
end
