
require "spec_helper"

describe Die do
  subject { Die.new}

  it{is_expected.to respond_to :roll}
  it{is_expected.to respond_to :to_s}
  it{is_expected.to respond_to :to_i}
  it{is_expected.to respond_to :<=>}
  #TODO add a comparison operator  eg. <=>
end
