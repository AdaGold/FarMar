require_relative './spec_helper'
require 'pry'



describe FarMar::Vendor do
  it "exists" do
    FarMar::Vendor.wont_be_nil
  end
end

describe FarMar::Vendor do
  let(:vendor) { FarMar::Vendor.new(id: 10) }

    it "it creates a new vendor instance" do
    vendor.must_be_instance_of(FarMar::Vendor)
    end
  end

  describe "self#all" do
    let(:vendor) { FarMar::Vendor.all}

    it "returns an array of FarMar::Vendor instances" do
      vendor.must_be_instance_of(Array)
    end

    it "return a collection of instances from the CSV file in FarMar:Vendor" do
      classes = FarMar::Vendor.all.map { |v| v.class }
      classes.uniq.must_equal([FarMar::Vendor])
    end
  end

  describe "self#find(id)" do
    # one instance of a vendor class with an id value of one
    # this is an actual vendor
    let(:vendor) { FarMar::Vendor.find(1) }

    it "returns a collection of FarMar::Vendor instances of id" do
      vendor.must_be_instance_of(FarMar::Vendor)
    end

    it "returns nil for markets it does not find" do
      FarMar::Vendor.find(610_000).must_equal(nil)
    end
  end

describe "market" do
  let(:vendor) { FarMar::Vendor.find(5) }

  #checking to see if the type is correct:
  it "returns a collection of FarMar::Vendor id are instances in an array" do
    vendor.market.must_be_instance_of(Array)
  end

  # checking if the objects in Array are correct:
  it "returns a collection of FarMar::Vendor objects" do
    classes = vendor.market.map { |m| m.class }
    classes.uniq.must_equal([FarMar::Market])
  end
  #.vendors is an instance method getting called on markets which was set up in this test .find(17)
  it "returns an instance of the FarMar::Market id instances" do
    market = vendor.market.map { |m| m.id }
    market.uniq.must_equal([vendor.market_id])
  end
end

describe "products" do
    let(:vendor) { FarMar::Vendor.find(4) }

    #checking to see if the type is correct:
    it "returns a collection of FarMar::Vendor id are instances in an array" do
      vendor.products.must_be_instance_of(Array)
    end

    # checking if the objects in Array are correct:
    it "returns a collection of FarMar::Vendor objects" do
      classes = vendor.products.map { |m| m.class }
      classes.uniq.must_equal([FarMar::Product])
    end
    #.vendors is an instance method getting called on markets which was set up in this test .find(17)
    it "returns an instance of the FarMar::Product id instances" do
      product = vendor.products.map { |p| p.vendor_id } # 4,Yummy Fruit,3
      product.uniq.must_equal([vendor.id])
    end
  end

  describe "sales" do
      let(:vendor) { FarMar::Vendor.find(4) }

      #checking to see if the type is correct:
      it "returns a collection of FarMar::Vendor id are instances in an array" do
        vendor.sales.must_be_instance_of(Array)
      end

      # checking if the objects in Array are correct:
      it "returns a collection of FarMar::Vendor objects" do
        classes = vendor.sales.map { |m| m.class }
        classes.uniq.must_equal([FarMar::Sale])
      end
      #.vendors is an instance method getting called on markets which was set up in this test .find(17)
      it "returns an instance of the FarMar::Product id instances" do
        sale = vendor.products.map { |s| s.vendor_id } # 4,Yummy Fruit,3
        sale.uniq.must_equal([vendor.id])
      end
    end

describe "revenue" do
  let(:vendor) { FarMar::Vendor.find(14)}

 it "a collection of instance amount sums returned in an array" do
   vendor.sales.must_be_instance_of(Array)
 end

 it "sums all of the vendor's sales" do
   vendor.revenue.must_equal("5311.00")
 end
end


describe "self#by_market(market_id)" do
  let(:vendor) { FarMar::Vendor.by_market(14) }

  it "returns in an instance of vendors in an array" do
    vendor.must_be_instance_of(Array)
  end

  it "returns an object of FarMar::Vendor instances" do
    classes = vendor.map { |v| v.class }
    classes.uniq.must_equal([FarMar::Vendor])
    end

  it "returns all of the vendors with the given market_id" do
    vendor.each do |v|
      v.market_id.must_equal(14)
    end
  end

end
