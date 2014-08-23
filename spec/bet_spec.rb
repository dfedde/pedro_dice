require "spec_helper"

describe Bet do
  before :each do
    @bet = Bet.new
  end
  [
    [[1,1], [1,2],   -1 ],
    [[1,1], [2,1],   -1 ],
    [[1,2], [1,1],    1 ],
    [[2,1], [1,1],    1 ],
    [[1,1], [1,1],    0 ],
    [[1,1], [2,2],   -1 ],
    [[2,1], [1,2],   -1 ]
  ].each do |comp|

    acount, aside = comp[0]
    bcount, bside = comp[1]
    diff          = comp[2]

    it "a bet with a count of #{acount} and a side of #{aside} is #{["smaller than", "equal to", "bigger than"][diff + 1]} a bet with a count of #{bcount} and a side of #{bside}" do
      expect(Bet.new(acount, aside) <=> Bet.new(bcount, bside)).to eql diff
    end
  end
end
