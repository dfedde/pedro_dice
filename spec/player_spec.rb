require "spec_helper"

describe Player do

  let(:player){Player.new}

  it{ expect(player).to respond_to :bet  }
  it{ expect(player).to respond_to :dice }

end
