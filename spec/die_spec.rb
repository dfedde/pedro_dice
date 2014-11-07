
require "spec_helper"

describe PedroDice::Die do
  subject   { PedroDice::Die.new }
  let(:die) { PedroDice::Die.new }

  it { is_expected.to respond_to :roll      }
  it { is_expected.to respond_to :to_s      }
  it { is_expected.to respond_to :to_i      }
  it { is_expected.to respond_to :to_symbol }
  it { is_expected.to respond_to :<=>       }

  describe "::new" do

    context "when a single argument is given" do

      it "sets the value" do
        expect(PedroDice::Die.new(6).to_i).to be 6
      end

    end

    context "when no argument is given" do

      it "roll is called" do
        expect_any_instance_of(PedroDice::Die).to receive :roll
        PedroDice::Die.new
      end

    end

  end

  describe "#roll" do

    it "will set the value to a ranom number" do
      values = (1..5).map {die.roll.to_i}.uniq
      expect(values.length).to be > 1
    end

  end

  describe "#<=>" do

    context "comparing a dice of 4 to a dice of 1" do

      it "results in a 1" do
        expect(PedroDice::Die.new(4) <=> PedroDice::Die.new(1)).to be 1
      end

    end

    context "comparing a dice of 1 to a dice of 4" do

      it "results in a -1" do
        expect(PedroDice::Die.new(1) <=> PedroDice::Die.new(4)).to be (-1)
      end

    end

    context "comparing a dice of 2 to a dice of 2" do

      it "results in a 0" do
        expect(PedroDice::Die.new(2) <=> PedroDice::Die.new(2)).to be 0
      end

    end
  end

  describe "#to_s" do
    %w(ace deuce trey cater cinque sice).each_with_index do |name, i|
      side = i + 1
      context "when value is #{side}" do

        it "returns #{name}" do
          expect(PedroDice::Die.new(side).to_s).to eql name
        end
      end
    end
  end

  describe "#to_symbol" do
    %w(⚀ ⚁ ⚂ ⚃ ⚄ ⚅).each_with_index do |symbol, i|
      side = i + 1
      context "when value is #{side}" do

        it "returns #{symbol}" do
          expect(PedroDice::Die.new(side).to_symbol).to eql symbol
        end
      end
    end
  end
end
