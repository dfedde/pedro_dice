##
# a object to represent a bet a side of the dice and a number of them
# 

class Bet

  include Comparable

  attr_accessor :count, :side

  def initialize(count = 0, side = 0)
    @count = count
    @side  = side
  end

  ##
  # compares 2 dice objects 
  # 
  # both the count and the side must be larger for it to return 1
  # like-wise the side and the count must be smaller to return -1
  # if they are all the same it returns one
  # 
  # @return [Integer] 1, 0, or -1 if its bigger equal or smaller respectively
  def <=> other
   return  -1  if self.count < other.count or self.side < other.side
   return   1  if self.count > other.count or self.side > other.side
   0
  end

  ##
  # counts the numbers of dice each player has and returns a bet object
  #
  # this method may be unnecessary and thus removed
  #
  # @return [Bet] the total count of sides from each player from each player
  def self.from_players(players, count)
    players.inject(self.new) do |bet, player|
      bet.count += player[:rolls].select{|v| v==count}.length
      bet
    end
  end
end
