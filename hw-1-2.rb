class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

class RPSHand
  def self.build_strategy strategy
    strategy = strategy.downcase
    return :R if strategy == 'r'
    return :P if strategy == 'p'
    return :S if strategy == 's'
    return nil
  end
  def self.is_handable? potential_hand
    potential_hand[0].is_a?(String) &&
    RPSHand.build_strategy(potential_hand[1]) != nil &&
      potential_hand.length == 2
  end

  def initialize hand_data
    @player = hand_data[0]
    @strategy = RPSHand.build_strategy hand_data[1]
    raise NoSuchStrategyError unless @strategy != nil
  end

  def strategy; @strategy; end

  def play other_hand
    left = self.strategy
    right = other_hand.strategy
    return self unless 
      (left == :R && right == :P) ||
      (left == :P && right == :S) ||
      (left == :S && right == :R) 
    return other_hand
  end

  def to_array; [@player, @strategy.to_s]; end

end

def rps_game_winner game
  raise WrongNumberOfPlayersError unless game.length == 2
  RPSHand.new(game[0]).play(RPSHand.new(game[1])).to_array
end

def rps_resolve_side side
  return RPSHand.new(side) if RPSHand.is_handable? side
  return rps_resolve_tournament side
end

def rps_resolve_tournament tournament
  left = rps_resolve_side tournament[0]
  right= rps_resolve_side tournament[1]
  left.play(right)
end

def rps_tournament_winner tournament
  rps_resolve_tournament(tournament).to_array
end
