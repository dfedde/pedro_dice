###############################################################################
#  A Player object is a a player of the game he is a better a roller
###############################################################################

require "bet"
class Player
  attr_accessor :bet, :dice

  def initialize(bet = Bet.new, dice = 6)
    raise ArgumentError.new "Bet must be a Bet object" if bet.is_a? Bet
    raise ArgumentError.new "Dice must be a Int object" if bet.is_a? Intager
  end
end
