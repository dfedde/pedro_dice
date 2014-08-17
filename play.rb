##
# this is a simple ruby implmantation on a common dice game
# i want to port this to a irc game soon so a simple dice game can be played online
#
#

class Bet

  include Comparable

  attr_accessor :count, :side
  def initialize
    @count = 0
    @side  = 0
  end

  def <=> other
   return  1  if self.count > other.count and self.side > other.side
   return  -1 if self.count < other.count and self.side < other.side
   0
  end

  def self.from_players(players, count)
    players.inject(self.new) do |bet, player|
      bet.count += player[:rolls].select{|v| v==count}.length
      bet
    end
  end
end

players = []
player_proto = {dice: 6}

def roll
  Random.new.rand(6) + 1
end

def ask_for_bet
  puts "what do you bet?"
  bet_parser gets.chomp
end

def bet_parser bet
  numbers = %w(one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen nineteen)
  guess = Bet.new
  if    bet =~ /^[a-zA-Z]+ [a-zA-Z]+$/
    #parse the bet as words
    guess.count = numbers.index(bet.split(" ")[0]) + 1
    guess.side  = numbers.index(bet.split(" ")[1].chomp("s")) + 1
  elsif bet =~ /^\d+ \d+s?$/
    #parse the bet as number litatals
    guess.count = (bet.split(" ")[0]).to_i
    guess.side  = (bet.split(" ")[1].chomp("s")).to_i
  elsif bet =~ /^\d+ [a-zA-Z]+$/
    #parse the bet as  a number first and then a word second
    guess.side  = numbers.index(bet.split(" ")[1].chomp("s")) + 1
    guess.count = (bet.split(" ")[0]).to_i
  elsif bet =~ /^[a-zA-Z]+ \d+s?$/
    #parse the bet as a word first and then a number second
    guess.count = numbers.index(bet.split(" ")[0]) + 1
    guess.side  = (bet.split(" ")[1].chomp("s")).to_i
  end
  guess
end

2.times do
  players << player_proto
end

players.each do |p|
  p[:rolls] = []
  p[:dice].times do
    p[:rolls] << roll
  end
end
print players
players.inject(Bet.new) do |last_bet, player|
  bet = ask_for_bet
  if bet > last_bet
    puts "do you belive them?"
    unless gets.chomp =~ /y|yes|yey|yea|yep/
      puts "you fail" if Bet.from_players(players, bet.side) < bet
      puts "you win"  if Bet.from_players(players, bet.side) >= bet
      break
    end
  end
  bet
end

