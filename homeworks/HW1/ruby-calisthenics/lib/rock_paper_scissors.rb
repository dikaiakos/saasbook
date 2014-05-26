class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    # YOUR CODE HERE
  end

  def self.tournament_winner(tournament)

    # YOUR CODE HERE
  end

  def RockPaperScissors.winner(play1, play2)

    move1 = play1[1]
    move2 = play2[1]
    
    raise RockPaperScissors::NoSuchStrategyError, "Strategy must be one of R,P,S"  unless ["P","R","S"].include?(move1) && ["P","R","S"].include?(move2) 


    if (move1 == move2 || move1 == "P" && move2 == "R" || move1 == "S" && 
        move2 == "P" || move1 == "R" && move2 == "S") 
      return play1
    else
      return play2
    end
  end

  def RockPaperScissors.isTournament?(tourn)
    return true unless (tourn[0][0].class == String && tourn[1][0].class == String)
  end

  def RockPaperScissors.tournament_winner(tourn)

    if (self.isTournament?(tourn))
      puts "tour 1: #{tourn[0]}"
      puts "tour 2: #{tourn[1]}"
      return RockPaperScissors.winner(tournament_winner(tourn[0]), tournament_winner(tourn[1]))
    else 
      puts "game: #{tourn[0]} #{tourn[1]}"
      return RockPaperScissors.winner(tourn[0], tourn[1])
    end
  end

  
end

puts   RockPaperScissors.winner(['Armando','R'], ['Dave','S'])

puts RockPaperScissors.tournament_winner([[[["Armando", "P"], ["Dave", "S"]],
                                           [["Richard", "R"], ["Michael", "S"]]],
                                         [ [["Allen", "S"], ["Omer", "P"]],
                                           [["David E.", "R"], ["Richard X.", "P"]]]  ])

