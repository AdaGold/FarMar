class FarMar::Vendor
  attr_reader :id, :name, :no_of_employess, :market_id
  def initialize(vendor_data)
    @id = vendor_data[:id].to_i #fixnum
    @name = vendor_data[:name] #string
    @no_of_employess = vendor_data[:no_of_employess].to_i #fixnum
    @market_id = vendor_data[:market_id].to_i #fixnum
  end

end
