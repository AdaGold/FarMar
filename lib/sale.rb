#require 'datetime'
class FarMar::Sale
  attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id
  def initialize(sale_data)
    @id = sale_data[:id].to_i #fixnum
    @amount = sale_data[:amount].to_i #fixnu
    @purchase_time = sale_data[:purchase_time] #datetime
    @vendor_id = sale_data[:vendor_id].to_i # fixnum
    @product_id = sale_data[:product_id].to_i #fixnum
  end


end
