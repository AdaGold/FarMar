class FarMar::Product
  FILENAME = "./support/products.csv"
  attr_reader :id, :name, :vendor_id
  def initialize(product_data)
    @id = product_data[:id].to_i #fixnum
    @name = product_data[:name] #string
    @vendor_id = product_data[:vendor_id].to_i #fixnum
  end

  def self.all # self is the class and all is the method
    products_collection = []
    CSV.open(FILENAME, "r") do |csv|
    csv.read.each do |line|
      products_collection << self.new( id: line[0], name: line[1], vendor_id: line[2] )
    end
    end
    return products_collection
  end

  def self.find(id)
    all_products = self.all
    all_products.each do |product|
      if product.id == id
        return product #an instance
      end
    end
  end

  def vendor
    all_vendors = FarMar::Vendor.all
    all_vendors.select do |vendor|
      vendor.id == vendor_id
    end
  end

  def sales
    all_sales = FarMar::Sale.all
    all_sales.select do |sale|
      sale.product_id == id
    end
  end

  # returns the number of times this product has been sold.
  def number_of_sales
    collect_number_of_times_product_sold = []
    collect_number_of_times_product_sold = sales.collect { |product| product.amount }
    return collect_number_of_times_product_sold.length
  end

  # returns all of the products with the given vendor_id
  def self.by_vendor(vendor_id)
    collect_products = [] # create an array to store the prodcuts
    collect_products = FarMar::Product.all.select do |product|  # returns all of the products with the given vendor_id that is equal to the product vendor_id
      product.vendor_id == vendor_id
    end
  end
end
