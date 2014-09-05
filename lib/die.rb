##
# this class represents a die
# it can be rolled
# and it can return its value as a int or a utf8 string
#
class Die

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
  end

  ##
  # return the value of the dice
  def to_i
    @value
  end

  ##
  # retun the utf8 string of the dice
  def to_s
  end

  ##
  # determain witch dice is bigger 
  def <=>
  end
end
