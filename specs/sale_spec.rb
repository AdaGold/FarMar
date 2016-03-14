require_relative './spec_helper'
require_relative '../far_mar'
#require_relative '../sale'


describe FarMar::Sale do
    before do
      market_data = {
        id: 1
      }
      @market = FarMar::Sale.new(market_data)
    end

    it "it creates a new Market instance" do
    @market.must_be_instance_of(FarMar::Sale)
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
