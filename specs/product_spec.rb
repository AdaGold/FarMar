require_relative './spec_helper'
# require_relative '../far_mar'
#require_relative '../product'

describe FarMar::Product do
    before do
      market_data = {
        id: 1
      }
      @market = FarMar::Product.new(market_data)
    end

    it "it creates a new Product instance" do
    @market.must_be_instance_of(FarMar::Product)
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
