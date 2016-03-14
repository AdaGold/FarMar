require_relative './spec_helper'
require_relative '../far_mar'
#require_relative '../vendor'

describe FarMar::Vendor do
  before do
    market_data = {
      id: 1,
      name: "Black Bottle Lunge"
    }
    @market = FarMar::Vendor.new(market_data)
  end

  it "it creates a new Product instance" do
  @market.must_be_instance_of(FarMar::Vendor)
  end
end

describe "SelfAll" do
  before do
    market_data = {
        id: 1,
        name: "Black Bottle Lounge"
    }
    @markets = FarMar::Product.new(market_data)
  end
  it "returns a collection of instances from the CSV file" do
    @markets.must_equal.(market_data)
  end
end
