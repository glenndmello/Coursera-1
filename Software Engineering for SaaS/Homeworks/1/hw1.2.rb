class WrongNumberOfPlayersError < StandardError ; end 
class NoSuchStrategyError < StandardError ; end

def valid_play?(play)
  !play.downcase.match(/[rps]/).nil?
end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  raise NoSuchStrategyError unless valid_play?(game[0][1]) and valid_play?(game[1][1])

  if    game[0][1].downcase == "r" and game[1][1].downcase == "p" then game[1]
  elsif game[0][1].downcase == "r" and game[1][1].downcase == "s" then game[0]
  elsif game[0][1].downcase == "p" and game[1][1].downcase == "r" then game[0]
  elsif game[0][1].downcase == "p" and game[1][1].downcase == "s" then game[1]
  elsif game[0][1].downcase == "s" and game[1][1].downcase == "r" then game[1]
  elsif game[0][1].downcase == "s" and game[1][1].downcase == "p" then game[0]
  else  game[0]
  end
end

def rps_tournament_winner(game)
  if game.flatten.length == 4
    rps_game_winner(game)
  else
    rps_tournament_winner([rps_tournament_winner(game[0]), rps_tournament_winner(game[1])])
  end
end
