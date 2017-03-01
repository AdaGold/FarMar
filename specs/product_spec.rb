require_relative './spec_helper'

describe FarMar::Product do
  it "exists" do
    FarMar::Product.wont_be_nil
  end
end

describe FarMar::Product do
  before do
    product_data = {
      id: 1
    }
    @products = FarMar::Product.new(product_data)
  end

  it "it creates a new Sale instance" do
  @products.must_be_instance_of(FarMar::Product)
  end
end

describe "self#all" do
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

describe "self#find" do
  before do
    # one instance of a sales class with an id value of one
    # this is an actual sales
    @one_sale = FarMar::Sale.find(1)
  end

  it "returns an instance of sales" do
    @one_sale.must_be_instance_of(FarMar::Sale)
  end
end

describe "FarMar::Product#vendor" do
  let(:product) { FarMar::Product.find(10) }

  it "returns FarMar::Vendor intances that are associated with the product id" do
    product.vendor[0].id.must_equal(5)
  end
end

describe "FarMar::Product#numberofsales" do
  let(:product) { FarMar::Product.find(5) }

  it "returns the number of times this product has been sold." do
    product.number_of_sales.must_equal(2)
  end
end


describe "self#by_vendor(vendor_id)" do
  let(:product) { FarMar::Product.find(45) }

  it "returns all of the products with the given vendor_id" do
    product.vendor_id.must_equal(16)
  end
end
