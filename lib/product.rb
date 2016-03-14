class FarMar::Product
  attr_reader :id, :name, :vendor_id
  def initialize(product_data)
    @id = product_data[:id].to_i #fixnum
    @name = product_data[:name] #string
    @vendor_id = product_data[:vendor_id].to_i #fixnum
  end

end
