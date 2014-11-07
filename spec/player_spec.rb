require "spec_helper"

describe PedroDice::Player do

  let(:player){PedroDice::Player.new}

  it{ expect(player).to respond_to :bet  }
  it{ expect(player).to respond_to :dice }

end
