require 'spec_helper'

describe Customer do
  it "should have an unique name" do
    Customer.create(:name => 'Acme')
    Customer.new(:name => 'Acme').should_not be_valid
  end
end
