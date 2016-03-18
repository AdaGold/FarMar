class FarMar::Vendor
  FILENAME = './support/vendors.csv'
  attr_reader :id, :name, :no_of_employess, :market_id
  def initialize(vendor_data)
    @id = vendor_data[:id].to_i #fixnum
    @name = vendor_data[:name] #string
    @no_of_employess = vendor_data[:no_of_employess].to_i #fixnum
    @market_id = vendor_data[:market_id].to_i #fixnum
  end

    def self.all # self is the class and all is the method
      # .all allows me to make a list of vendor instances from the csv file
      # .all is like a bucket that you fill up with all the vendors
      vendor_collection = []
      CSV.open(FILENAME, "r") do |csv|
      csv.read.each do |line|
        vendor_collection << self.new( id: line[0], name: line[1], no_of_employess: line[2], market_id: line[3] )
      end
      end
      return vendor_collection
    end

    def self.find(id)
      all_vendors = self.all
      all_vendors.each do |vendor|
        if vendor.id == id
          return vendor #an instance
        end
      end
      nil
    end

    def market
      # to FarMar,then go to the Market, look at all of them
      all_markets = FarMar::Market.all
      all_markets.select do |market| #
        market.id == market_id # market.id in FarMar::Market is equal to
      end
    end

    def products
      all_products = FarMar::Product.all
      all_products.select do |product|
        product.vendor_id == id # this selecets and returns a collection of prodcut instances
        end
    end

    # sales: returns a collection of FarMar::Sale instances that are associated by the vendor_id field.
    def sales
      all_sales = FarMar::Sale.all
      all_sales.select do |sale|
        sale.vendor_id == id
      end
    end

    # revenue: returns the the sum of all of the vendor's sales (in cents)
    def revenue
      collect_money = [] # store an empty array
      collect_money = sales.collect { |sale| sale.amount } # set up the method. collecting the amount
      sum_money = collect_money.inject(0, :+) # adding together the collected money amount
      sprintf("%.2f", sum_money.to_f)
    end

    def self.by_market(market_id) # pass in a market.id
      collect_vendors = []   # create an array to store the vendors associated with the given market_id
      collect_vendors = FarMar::Vendor.all.select do |vendor| # returns all of the vendors with the given market_id that is equal to the vendor market_id
        vendor.market_id == market_id   # look at the vendors to see if it has a market.id if so give them to me
      end
    end

end
