require "spec_helper"

describe Player do

  let(:player){Player.new}

  it{ expect(player).to respond_to :bet  }
  it{ expect(player).to respond_to :dice }

  it "will raise a argumanet error if the arugment for bet is not a bet" do
    expect{Player.new Bet.new, "cow"}.to raise_error
  end

  it "will raise a argumanet error if the arugment for dice is not a number" do
    expect{Player.new "cow"}.to raise_error
  end
  it "will not raise and error the arugments are corect" do
    expect{Player.new Bet.new, 9 }.to_not raise_error
  end
end
