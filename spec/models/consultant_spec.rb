require 'spec_helper'

describe Consultant do

  it "should have an unique name" do
    Consultant.create(:name => 'Bob')
    Consultant.new(:name => 'Bob').should_not be_valid
  end
end
