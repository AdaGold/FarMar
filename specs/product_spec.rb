require_relative './spec_helper'

describe FarMar::Product do
  it "exists" do
    FarMar::Product.wont_be_nil
  end
end

describe FarMar::Product do
    before do
      market_data = {
        id: 1
      }
      @products = FarMar::Product.new(id: 1)
    end

    it "it creates a new Sale instance" do
    @products.must_be_instance_of(FarMar::Product)
    end
  end

  describe "SelfAll" do
    before do
      @products = FarMar::Sale.all # all is a self class
    end

    it "returns an array" do
      @products.must_be_instance_of(Array)
    end

    it "returns a collection of instances from the CSV file" do
      @products[0].must_be_instance_of(FarMar::Sale)
    end
  end

  describe "SelfFindMethod" do
    before do
      # one instance of a sales class with an id value of one
      # this is an actual sales
      @one_sale = FarMar::Sale.find(1)
    end

    it "returns an instance of sales" do
      @one_sale.must_be_instance_of(FarMar::Sale)
    end
  end
