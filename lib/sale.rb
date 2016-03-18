require 'chronic'
class FarMar::Sale
  FILENAME = "./support/sales.csv"
  VENDORS_CSV = './support/vendors.csv'
  attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id
  def initialize(sale_data)
    @id = sale_data[:id].to_i #fixnum
    @amount = sale_data[:amount].to_i #fixnu
    @purchase_time = DateTime.parse(sale_data[:purchase_time]) #datetime
    @vendor_id = sale_data[:vendor_id].to_i # fixnum
    @product_id = sale_data[:product_id].to_i #fixnum
  end

  def self.all # self is the class and all is the method
    sales_collect = []
    CSV.open(FILENAME, "r") do |csv|
    csv.read.each do |line|
      sales_collect << self.new( id: line[0], amount: line[1], purchase_time: line[2], vendor_id: line[3], product_id: line[4] )
    end
    end
    return sales_collect
  end

  def self.find(id)
    matched_sales = nil
    all_sales = self.all
    all_sales.each do |sale|
      if sale.id == id
        matched_sales = sale
      end
    end
    return matched_sales #an instance
  end

    # def vendor
    #   all_vendors = FarMar::Vendor.all
    #   all_vendors.select do |vendor|
    #     vendor.id == vendor_id
    #   end
    # end
    def vendor
      CSV.foreach(VENDORS_CSV) do |line|
        return FarMar::Vendor.new(line) if line[0].to_s == self.vendor_id
      end
    end

        # FarMar::Product instance that is associated with this sale using the FarMar::Sale product_id
    def product
      all_products = FarMar::Product.all
      all_products.select do |product|
        product.id == product_id
      end
    end


    def self.between(beginning_time, end_time)
      # beginning_time = Time.parse(beginning_time)
      # end_time = Time.parse(end_time)
      time_range = (beginning_time..end_time)
      # 2013-11-07 04:34:56 -0800
      FarMar::Sale.all.select do |sale|
        time_range.include?(sale.purchase_time)
      end
    end


end
