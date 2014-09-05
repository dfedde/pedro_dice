##
# this class represents a die
# it can be rolled
# and it can return its value as a int or a utf8 string
#
class Die
  include Comparable

  Random = Random.new


  ##
  # creates a new Die object
  #
  # @param value [integer] the value of the dice
  def initialize(value = nil)
    @value = value || self.roll.to_i
  end

  ##
  # roll the dice
  def roll
    @value = Random.rand 1..6
    self
  end

  ##
  # return the value of the dice
  def to_i
    @value
  end

  ##
  # retun the name of a dice side
  def to_s
    %w(0 ace deuce trey cater cinque sice)[@value]
  end

  ##
  # determain witch dice is bigger 
  def <=> other
    self.to_i <=> other.to_i
  end
end
