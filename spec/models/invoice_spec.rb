require 'spec_helper'

describe Invoice do
  before(:each) do
    @invoice=FactoryGirl.build(:invoice)
    @invoice.customer=FactoryGirl.create(:customer)
  end

  it "should require a customer" do
    FactoryGirl.build(:invoice, customer_id: nil).should_not be_valid
    @invoice.should be_valid
  end

  it "should not let me invoice if there are no invoice_items" do
    @invoice.invoice_items.should have(0).items
    @invoice.invoice_customer.should be_false
  end

  describe "with valid invoice items" do
    before(:each) do
      consultant=FactoryGirl.create(:consultant)
      @invoice.save
      @invoice.invoice_items.create(:consultant => consultant)
      @invoice.invoice_customer
    end

    it "it should have set invoice date to today" do
      @invoice.invoice_date.should eq(Date.today)
    end

    it "should set due date to be today + term days" do
      @invoice.due_date.should eq(Date.today + @invoice.term_days)
    end
  end

  describe "term days should return different values depending on what is set." do
    it "should return 30 if nothing is set" do
      @invoice.term_days.should eq(30)
    end
    it "should return the customer's default term if a customer has it set" do
      @invoice.customer.default_term=37
      @invoice.term_days.should eq(37)
    end
    it "should return the set term if present" do
      @invoice.term=35
      @invoice.term_days.should eq(35)
    end
  end

end
