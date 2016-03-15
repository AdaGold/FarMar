require_relative './spec_helper'
require_relative '../far_mar'
#require_relative '../vendor'
describe FarMar::Vendor do
  it "exists" do
    FarMar::Vendor.wont_be_nil
  end
end 
describe FarMar::Vendor do
    before do
      market_data = {
        id: 1
      }
      @vendor = FarMar::Vendor.new(market_data)
    end

    it "it creates a new Vendor instance" do
    @vendor.must_be_instance_of(FarMar::Vendor)
    end
  end

  describe "SelfAll" do
    before do
      @vendor = FarMar::Vendor.all # all is a self class
    end

    it "returns an array" do
      @vendor.must_be_instance_of(Array)
    end

    it "returns a collection of instances from the CSV file" do
      @vendor[0].must_be_instance_of(FarMar::Vendor)
    end
  end

  describe "SelfFindMethod" do
    before do
      # one instance of a vendor class with an id value of one
      # this is an actual vendor
      @one_vendor = FarMar::Vendor.find(1)
    end

    it "returns an instance of vendor" do
      @one_vendor.must_be_instance_of(FarMar::Vendor)
    end
  end
