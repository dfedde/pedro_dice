
require "spec_helper"

describe Die do
  subject { Die.new}
  let(:die) {Die.new}

  it{is_expected.to respond_to :roll}
  it{is_expected.to respond_to :to_s}
  it{is_expected.to respond_to :to_i}
  it{is_expected.to respond_to :<=>}

  describe "::new" do

    context "when a single argument is given" do

      it "sets the value" do
        expect(Die.new(6).to_i).to be 6
      end

    end

    context "when no argument is given" do

      it "roll is called" do
        expect_any_instance_of(Die).to receive :roll
        Die.new
      end

    end

  end

end
