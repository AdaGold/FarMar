require_relative './spec_helper'
#require_relative '../far_mar'
#require_relative '../market'


describe FarMar::Market do

  before do
    market_data = {
      id: 1
    }
    @market = FarMar::Market.new(market_data)
  end

  it "it creates a new Market instance" do
  @market.must_be_instance_of(FarMar::Market)
  end
end

describe "SelfAll" do
  before do
    @markets = FarMar::Market.all # all is a self class
  end

  it "returns an array" do
    @markets.must_be_instance_of(Array)
  end

  it "returns a collection of instances from the CSV file" do
    @markets[0].must_be_instance_of(FarMar::Market)
  end
end

describe "SelfFindMethod" do
  before do
    @id = FarMar::Market.find(1)
  end

  it "returns an array" do
    @id.must_be_instance_of(Far)
  end
end
