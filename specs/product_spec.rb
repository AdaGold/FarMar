require_relative './spec_helper'
# require_relative '../far_mar'
#require_relative '../product'

describe FarMar::Product do

  # before do
  #   #@our_tile_bag = Scrabble::Tilebag.new
  # end

  it "it creates a new Product instance" do
  FarMar::Product.wont_be_nil
  end
end
