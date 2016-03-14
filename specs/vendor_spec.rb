require_relative './spec_helper'
require_relative '../far_mar'
#require_relative '../vendor'

describe FarMar::Vendor do
  # before do
  #   #@our_tile_bag = Scrabble::Tilebag.new
  # end
  it "it creates a new Vendor instance" do
  FarMar::Vendor.wont_be_nil
  end
end
